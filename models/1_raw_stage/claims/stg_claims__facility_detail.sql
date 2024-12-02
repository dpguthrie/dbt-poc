with 

source as (

    select * from {{ source('claims', 'facilitydetail') }}

),

renamed as (

    select
        providerid as provider_id,
        bedsize as bed_size,
        region,
        geographicclassification as geographic_classification,
        hospitaltype as hospital_type,
        teachingstatus as teaching_status,
        facilityzip as facility_zip

    from source

)

select * from renamed
