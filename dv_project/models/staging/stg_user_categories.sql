{%- set yaml_metadata -%}
source_model:
  sample_dataset: user_categories
derived_columns:
  record_source: '!user_categories'
  load_datetime: 'CURRENT_DATETIME("Asia/Tokyo")'
hashed_columns:
  user_category_hashdiff:
    is_hashdiff: true
    columns:
      - 'slot'
      - 'created_at'
      - 'updated_at'
  user_category_hk:
    - 'user_id'
    - 'category_id'
  user_hk:
    - 'user_id'
  category_hk:
    - 'category_id'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=true
                , source_model=metadata_dict['source_model']
		, derived_columns=metadata_dict['derived_columns']
		, hashed_columns=metadata_dict['hashed_columns']
		, ranked_columns=none) }}
