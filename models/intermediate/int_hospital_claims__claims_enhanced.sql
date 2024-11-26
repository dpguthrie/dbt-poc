WITH claim_detail AS (

    SELECT * FROM {{ ref('stg_claims__claim_detail') }}

),

diagnosis_detail AS (

    SELECT
        site_id,
        claim_id,
        ARRAY_AGG(DISTINCT diag_code) AS diagnosis_codes
    FROM {{ ref('stg_claims__diagnosis_detail') }}
    GROUP BY site_id, claim_id

),

procedure_detail AS (

    SELECT
        site_id,
        claim_id,
        ARRAY_AGG(DISTINCT procedure_code) AS procedure_codes
    FROM {{ ref('stg_claims__procedure_detail') }}
    GROUP BY site_id, claim_id

),

cpt_detail AS (

    SELECT
        site_id,
        claim_id,
        ARRAY_AGG(DISTINCT cpt_code) AS cpt_codes
    FROM {{ ref('stg_claims__cpt_detail') }}
    GROUP BY site_id, claim_id

)

SELECT
    cd.*,
    dd.diagnosis_codes,
    pd.procedure_codes,
    cpt.cpt_codes
FROM claim_detail cd
LEFT JOIN diagnosis_detail dd
    ON cd.site_id = dd.site_id AND cd.claim_id = dd.claim_id
LEFT JOIN procedure_detail pd
    ON cd.site_id = pd.site_id AND cd.claim_id = pd.claim_id
LEFT JOIN cpt_detail cpt
    ON cd.site_id = cpt.site_id AND cd.claim_id = cpt.claim_id
