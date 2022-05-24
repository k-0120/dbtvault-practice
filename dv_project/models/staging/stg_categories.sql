{%- set yaml_metadata -%}
source_model:
  sample_dataset: categories
derived_columns:
  record_source: '!categories'
  load_datetime: 'CURRENT_DATETIME("Asia/Tokyo")'
hashed_columns:
  category_hashdiff:
    is_hashdiff: true
    columns:
      - 'id'
      - 'name'
      - 'created_at'
      - 'updated_at'
  category_hk:
    - 'id'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=true
                , source_model=metadata_dict['source_model']
		, derived_columns=metadata_dict['derived_columns']
		, hashed_columns=metadata_dict['hashed_columns']
		, ranked_columns=none) }}
