select * from {{ source('input_layer', 'observation') }}