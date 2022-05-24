{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
source_model: 'stg_users'
src_pk: 'USER_HK'
src_hashdiff: 'USER_HASHDIFF'
src_payload:
  - 'NAME'
  - 'EMAIL'
  - 'CREATED_AT'
  - 'UPDATED_AT'
src_ldts: 'LOAD_DATETIME'
src_source: 'RECORD_SOURCE'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.sat(source_model=metadata_dict['source_model']
              , src_pk=metadata_dict['src_pk']
	      , src_hashdiff=metadata_dict['src_hashdiff']
	      , src_payload=metadata_dict['src_payload']
	      , src_eff=none
	      , src_ldts=metadata_dict['src_ldts']
	      , src_source=metadata_dict['src_source']) }}
