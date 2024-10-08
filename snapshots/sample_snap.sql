{% snapshot sample_snapshot %}

    {{
        config(
            target_database="DBT_DB",
            target_schema="snapshots",
            unique_key="OFFICECODE",
            strategy="timestamp",
            updated_at="UPDATE_DATE",
        )
    }}

    select *
    from {{ ref("classiccars_country_samury") }}

{% endsnapshot %}
