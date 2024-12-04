WITH source AS (

    SELECT * FROM {{ source('hospital_claims_data', 'claimdetail') }}

),

renamed AS (

    SELECT
        SITEID AS site_id,
        CLAIMID AS claim_id,
        MATCHED_YN AS matched_yn,
        PRIMARYCLAIMID AS primary_claim_id,
        PRICLAIMID_ROWNUM AS pri_claim_id_rownum,
        ROOTCLAIMID AS root_claim_id,
        ICN AS icn,
        BSEQ AS bseq,
        NPAY AS npay,
        LINKEDCLAIMTYPECODE AS linked_claim_type_code,
        LINKEDCLAIMTYPEDESC AS linked_claim_type_desc,
        BILLEDDATE AS billed_date,
        IMPORTDATE AS import_date,
        EXPORTDATE AS export_date,
        STMFROM AS stm_from,
        STMTHRU AS stm_thru,
        PAYERRCVDATE AS payer_rcv_date,
        CLAIMTYPECODE AS claim_type_code,
        CLAIMTYPENAME AS claim_type_name,
        TOB AS tob,
        TOBTYPE AS tob_type,
        TOBFACILITYTYPE AS tob_facility_type,
        TOBCLASSIFICATION AS tob_classification,
        TOBFREQUENCY AS tob_frequency,
        TOTALCHARGES AS total_charges,
        ESTAMTDUE AS est_amt_due,
        RENDERINGPROVIDERNPI AS rendering_provider_npi,
        RENDERINGPROVIDERNAMELAST AS rendering_provider_last_name,
        RENDERINGPROVIDERNAMEFIRST AS rendering_provider_first_name,
        RENDERINGPROVIDERNAMEMIDDLE AS rendering_provider_middle_name,
        RENDERINGPROVIDERTAXID AS rendering_provider_tax_id,
        RENDERINGPROVIDERTAXONOMY AS rendering_provider_taxonomy,
        ATTENDINGPHYSICIANNPI AS attending_physician_npi,
        ATTENDINGPHYSICIANLASTNAME AS attending_physician_last_name,
        ATTENDINGPHYSICIANFIRSTNAME AS attending_physician_first_name,
        ATTENDINGPHYSICIANMIDDLENAME AS attending_physician_middle_name,
        ATTENDINGPHYSICIANTAXONOMY AS attending_physician_taxonomy,
        OPERATINGPHYSICIANNPI AS operating_physician_npi,
        OPERATINGPHYSICIANLASTNAME AS operating_physician_last_name,
        OPERATINGPHYSICIANFIRSTNAME AS operating_physician_first_name,
        OPERATINGPHYSICIANMIDDLENAME AS operating_physician_middle_name,
        OPERATINGPHYSICIANTAXONOMY AS operating_physician_taxonomy,
        OTHERPHYSICIANNPI AS other_physician_npi,
        OTHERPHYSICIANLASTNAME AS other_physician_last_name,
        OTHERPHYSICIANFIRSTNAME AS other_physician_first_name,
        OTHERPHYSICIANMIDDLENAME AS other_physician_middle_name,
        OTHERPHYSICIANTAXONOMY AS other_physician_taxonomy,
        REFERRINGPHYSICIANNPI AS referring_physician_npi,
        REFERRINGPHYSICIANLASTNAME AS referring_physician_last_name,
        REFERRINGPHYSICIANFIRSTNAME AS referring_physician_first_name,
        REFERRINGPHYSICIANMIDDLENAME AS referring_physician_middle_name,
        REFERRINGPHYSICIANTAXONOMY AS referring_physician_taxonomy,
        PAYERPRIMARYTYPECODE AS payer_primary_type_code,
        PAYERPRIMARYTYPEDESC AS payer_primary_type_desc,
        PAYERPRIMARYID AS payer_primary_id,
        PAYERPRIMARYNAME AS payer_primary_name,
        PAYERPRIMARYADDRESS1 AS payer_primary_address1,
        PAYERPRIMARYADDRESS2 AS payer_primary_address2,
        PAYERPRIMARYCITY AS payer_primary_city,
        PAYERPRIMARYSTATE AS payer_primary_state,
        PAYERPRIMARYZIP AS payer_primary_zip,
        PAYERPRIMARYPLANCODE AS payer_primary_plan_code,
        PAYERSECONDARYTYPECODE AS payer_secondary_type_code,
        PAYERSECONDARYTYPEDESC AS payer_secondary_type_desc,
        PAYERSECONDARYID AS payer_secondary_id,
        PAYERSECONDARYNAME AS payer_secondary_name,
        PAYERSECONDARYADDRESS1 AS payer_secondary_address1,
        PAYERSECONDARYADDRESS2 AS payer_secondary_address2,
        PAYERSECONDARYCITY AS payer_secondary_city,
        PAYERSECONDARYSTATE AS payer_secondary_state,
        PAYERSECONDARYZIP AS payer_secondary_zip,
        PAYERSECONDARYPLANCODE AS payer_secondary_plan_code,
        DRGCODE AS drg_code,
        PRINCIPALPROCEDURECODE AS principal_procedure_code,
        PRINCIPALPROCEDUREDATE AS principal_procedure_date,
        UBCONDITIONCODES AS ub_condition_codes,
        UBOCCCODES AS ub_occ_codes,
        UBOCCSPANCODES AS ub_occ_span_codes,
        UBVALUECODES AS ub_value_codes,
        REVCODES AS rev_codes,
        PRIMARYDIAGNOSIS AS primary_diagnosis,
        ADMITTINGDIAGNOSIS AS admitting_diagnosis,
        ICDVERSION AS icd_version,
        PRIMARYDIAGNOSIS_POA AS primary_diagnosis_poa,
        EXTERNALCAUSEOFINJURY1 AS external_cause_of_injury1,
        EXTERNALCAUSEOFINJURY2 AS external_cause_of_injury2,
        EXTERNALCAUSEOFINJURY3 AS external_cause_of_injury3,
        EXTERNALCAUSEOFINJURY1_POA AS external_cause_of_injury1_poa,
        EXTERNALCAUSEOFINJURY2_POA AS external_cause_of_injury2_poa,
        EXTERNALCAUSEOFINJURY3_POA AS external_cause_of_injury3_poa,
        PATINTREASONFORVISIT1 AS patient_reason_for_visit1,
        PATINTREASONFORVISIT2 AS patient_reason_for_visit2,
        PATINTREASONFORVISIT3 AS patient_reason_for_visit3,
        PATIENT_KEY AS patient_key,
        CHARGEDETAILAVAIL_YN AS charge_detail_avail_yn,
        UNIQUEPATIENT_KEY AS unique_patient_key,
        ADMISSIONSOURCE AS admission_source,
        ADMISSIONTYPE AS admission_type,
        DISCHARGESTATUS AS discharge_status,
        PROVIDERID AS provider_id
    FROM source

)

SELECT * FROM renamed
   

