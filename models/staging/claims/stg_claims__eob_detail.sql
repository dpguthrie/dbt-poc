WITH source AS (

    SELECT * FROM {{ source('hospital_claims_data', 'eobdetail') }}

),

renamed AS (

    SELECT
        SITEID AS site_id,
        EOBID AS eob_id,
        CLAIMID AS claim_id,
        PRIMARYCLAIMID AS primary_claim_id,
        PRICLAIMID_EOBROWNUM AS pri_claim_id_eob_rownum,
        EOBTYPE AS eob_type,
        EOBIMPORTSOURCE AS eob_import_source,
        TYPEOFBILL AS type_of_bill,
        CHECKNUMBER AS check_number,
        PAYEENPI AS payee_npi,
        REMITPAYERNAME AS remit_payer_name,
        EOBPAYERCODE AS eob_payer_code,
        EOBPAYERID AS eob_payer_id,
        EOBPAYERNAME AS eob_payer_name,
        APPLICATIONSENDER AS application_sender,
        EOBCROSSOVERPAYERNAME AS eob_crossover_payer_name,
        EOBCROSSOVERPAYERID AS eob_crossover_payer_id,
        STMFROM AS stm_from,
        STMTHRU AS stm_thru,
        BILLDATE AS bill_date,
        PROCDATE AS proc_date,
        LASTMODIFIEDDATE AS last_modified_date,
        CREATIONDATE AS creation_date,
        PAYMENTDATE AS payment_date,
        EOBDRG AS eob_drg,
        BILLEDAMOUNT AS billed_amount,
        COVEREDCHARGES AS covered_charges,
        NONCOVEREDCHARGES AS non_covered_charges,
        PAIDAMOUNT AS paid_amount,
        TOTALADJUSTMENTAMOUNT AS total_adjustment_amount,
        CONTRACTUALADJUSTMENT AS contractual_adjustment,
        DEDUCTIBLEADJUSTMENT AS deductible_adjustment,
        COPAYADJUSTMENT AS copay_adjustment,
        COINSURANCEADJUSTMENT AS coinsurance_adjustment,
        OTHERADJUSTMENT AS other_adjustment,
        DENIEDADJUSTMENT AS denied_adjustment,
        TOTALPATIENTRESPONSIBILITYADJUSTMENT AS total_patient_responsibility_adjustment,
        DENIALCATEGORYID AS denial_category_id
    FROM source

)

SELECT * FROM renamed
