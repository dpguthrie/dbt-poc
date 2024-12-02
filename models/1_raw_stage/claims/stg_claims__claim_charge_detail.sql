with 

source as (

    select * from {{ source('claims', 'claimchargedetail') }}

),

renamed as (

    select
        siteid as site_id,
        claimid as claim_id,
        claimstmfrom as claim_stm_from,
        claimstmthru as claim_stm_thru,
        lineitemcontrolnumber as line_item_control_number,
        chargeid as charge_id,
        chargedrugndcnumber as charge_drug_ndc_number,
        chargeprocedurecode as charge_procedure_code,
        chargerevenuecode as charge_revenue_code,
        chargestmfrom as charge_stm_from,
        chargestmthru as charge_stm_thru,
        chargeproceduredate as charge_procedure_date,
        placeofservicecode as place_of_service_code,
        modifier1 as modifier_1,
        modifier2 as modifier_2,
        modifier3 as modifier_3,
        modifier4 as modifier_4,
        charges,
        units

    from source

)

select * from renamed
