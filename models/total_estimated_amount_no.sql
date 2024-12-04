select

    site_id,
    sum(est_amt_due) as total_estimated_amount_due

from {{ ref('stg_hospital_claims_data__claimdetail') }}
group by site_id