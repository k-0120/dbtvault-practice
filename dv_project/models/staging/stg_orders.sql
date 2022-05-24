{%- set yaml_metadata -%}
source_model:
  sample_dataset: orders
derived_columns:
  record_source: '!orders'
  load_datetime: 'CURRENT_DATETIME("Asia/Tokyo")'
hashed_columns:
  order_hashdiff:
    is_hashdiff: true
    columns:
      - 'id'
      - 'total'
      - 'quantity'
      - 'created_at'
      - 'updated_at'
  order_hk:
    - 'id'
  user_hk:
    - 'user_id'
  product_hk:
    - 'product_id'
  order_user_hk:
    - 'id'
    - 'user_id'
  order_product_hk:
    - 'id'
    - 'product_id'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=true
                , source_model=metadata_dict['source_model']
		, derived_columns=metadata_dict['derived_columns']
		, hashed_columns=metadata_dict['hashed_columns']
		, ranked_columns=none) }}
