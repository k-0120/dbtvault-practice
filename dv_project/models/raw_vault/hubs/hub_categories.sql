{{ config(materialized='incremental') }}

{%- set source_model='stg_categories' -%}
{%- set src_pk='CATEGORY_HK' -%}
{%- set src_nk='ID' -%}
{%- set src_ldts='LOAD_DATETIME' -%}
{%- set src_source='RECORD_SOURCE' -%}

{{ dbtvault.hub(source_model=source_model
              , src_pk=src_pk
	      , src_nk=src_nk
	      , src_ldts=src_ldts
	      , src_source=src_source) }}
