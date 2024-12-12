WITH eob_detail AS (

    SELECT * FROM {{ ref('stg_claims__eob_detail') }}

),

eob_remark_codes AS (

    SELECT
        eob_id,
        ARRAY_AGG(DISTINCT code) AS remark_codes,
        SUM(amount) AS total_adjustment_amount
    FROM {{ ref('stg_claims__eob_remark_code_detail') }}
    GROUP BY eob_id

),

eob_enriched AS (

    SELECT
        ed.*,
        erc.remark_codes,
        erc.total_adjustment_amount AS calculated_total_adjustment_amount
    FROM eob_detail ed
    LEFT JOIN eob_remark_codes erc
        ON ed.eob_id = erc.eob_id

),

eob_calculations AS (

    SELECT
        ee.*,
        (ee.billed_amount - ee.paid_amount) AS patient_responsibility_amount,
        (ee.total_adjustment_amount - ee.calculated_total_adjustment_amount) AS adjustment_difference
    FROM eob_enriched ee

)

SELECT * FROM eob_calculations
