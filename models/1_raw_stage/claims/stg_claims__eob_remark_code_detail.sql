with 

source as (

    select * from {{ source('claims', 'eobremarkcodedetail') }}

),

renamed as (

    select
        siteid as site_id,
        eobid as eob_id,
        adjustmenttype as adjustment_type,
        eobchargeid as eob_charge_id,
        groupcode as group_code,
        adjustmentcode as adjustment_code,
        remarkcode as remark_code,
        code,
        description,
        quantity,
        amount,
        procedurecode as procedure_code,
        revenuecode as revenue_code,
        servicelineamount as service_line_amount,
        paidamount as paid_amount,
        linenumber as line_number,
        level,
        levelname as level_name,
        reasoncodetype as reason_code_type,
        apg,
        coinsadj as coins_adj,
        contractadj as contract_adj,
        copayadj as copay_adj,
        coveredcharges as covered_charges,
        deductadj as deduct_adj,
        deniedadj as denied_adj,
        nonconveredcharges as non_covered_charges,
        otheradj as other_adj,
        patamt as pat_amt,
        serviceperiodstart as service_period_start,
        serviceperiodend as service_period_end,
        units1 as units_1,
        units2 as units_2
    from source

)

select * from renamed
