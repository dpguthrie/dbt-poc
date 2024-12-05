with 

source as (

    select * from {{ source('claims', 'eobdetail') }}

),

renamed as (

    select
        siteid as site_id,
        eobid as eob_id,
        claimid as claim_id,
        primaryclaimid as primary_claim_id,
        priclaimid_eobrownum as pri_claim_id_eob_row_num,
        eobtype as eob_type,
        eobimportsource as eob_import_source,
        typeofbill as type_of_bill,
        checknumber as check_number,
        payeenpi as payee_npi,
        remitpayername as remit_payer_name,
        eobpayercode as eob_payer_code,
        eobpayerid as eob_payer_id,
        eobpayername as eob_payer_name,
        applicationsender as application_sender,
        eobcrossoverpayername as eob_crossover_payer_name,
        eobcrossoverpayerid as eob_crossover_payer_id,
        stmfrom as stm_from,
        stmthru as stm_thru,
        billdate as bill_date,
        procdate as proc_date,
        lastmodifieddate as last_modified_date,
        creationdate as creation_date,
        paymentdate as payment_date,
        eobdrg as eob_drg,
        billedamount as billed_amount,
        coveredcharges as covered_charges,
        noncoveredcharges as non_covered_charges,
        paidamount as paid_amount,
        totaladjustmentamount as total_adjustment_amount,
        contractualadjustment as contractual_adjustment,
        deductibleadjustment as deductible_adjustment,
        copayadjustment as copay_adjustment,
        coinsuranceadjustment as coinsurance_adjustment,
        otheradjustment as other_adjustment,
        deniedadjustment as denied_adjustment,
        totalpatientresponsibilityadjustment as total_patient_responsibility_adjustment,
        denialcategoryid as denial_category_id
    from source

)

select * from renamed
