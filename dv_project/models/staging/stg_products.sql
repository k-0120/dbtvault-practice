{%- set yaml_metadata -%}
source_model:
  sample_dataset: products
derived_columns:
  record_source: '!products'
  load_datetime: 'CURRENT_DATETIME("Asia/Tokyo")'
hashed_columns:
  product_hashdiff:
    is_hashdiff: true
    columns:
      - 'id'
      - 'name'
      - 'price'
      - 'created_at'
      - 'updated_at'
  product_hk:
    - 'id'
  category_hk:
    - 'category_id'
  product_category_hk:
    - 'id'
    - 'category_id'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=true
                , source_model=metadata_dict['source_model']
		, derived_columns=metadata_dict['derived_columns']
		, hashed_columns=metadata_dict['hashed_columns']
		, ranked_columns=none) }}
