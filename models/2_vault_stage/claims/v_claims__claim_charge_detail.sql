{% set yaml_metadata %}

source_model: stg_claims__claim_charge_detail
derived_columns:
  record_source: "!claim-charge-detail"
  load_datetime: "dateadd(day, 1, charge_procedure_date)"
  effective_from: "charge_procedure_date"

hashed_columns:
  site_hk: "site_id"
  claim_hk: "claim_id"
  site_claim_hk:
    - "site_id"
    - "claim_id"
  site_claim_hashdiff:
    is_hashdiff: true
    columns:
      - "site_id"
      - "claim_id"
      - "charge_drug_ndc_number"
      - "charge_procedure_code"
      - "charge_revenue_code"

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  null_columns=none,
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}
