{% snapshot shipments_snapshot %}
 
{{
    config
    (
        target_database = 'QWT_DEV',
        target_schema = 'Snapshot_Dev',
        unique_key = "orderid||'-'||lineno",

        strategy = 'timestamp',
        updated_at = 'SHIPMENTDATE'
    )
 
}}
 
select *from {{ref('STG_Shipments')}}
 
{% endsnapshot %}