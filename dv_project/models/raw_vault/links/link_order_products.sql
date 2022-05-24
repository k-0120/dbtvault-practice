{{ config(materialized='incremental') }}

{%- set source_model='stg_orders' -%}
{%- set src_pk='ORDER_PRODUCT_HK' -%}
{%- set src_fk=['ORDER_HK', 'PRODUCT_HK'] -%}
{%- set src_ldts='LOAD_DATETIME' -%}
{%- set src_source='RECORD_SOURCE' -%}

{{ dbtvault.link(source_model=source_model
               , src_pk=src_pk
	       , src_fk=src_fk
	       , src_ldts=src_ldts
	       , src_source=src_source) }}
