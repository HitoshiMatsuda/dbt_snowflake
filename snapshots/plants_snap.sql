{% snapshot plants_snapshot %}

    {{
        config(
            target_database="DBT_DB",
            target_schema="snapshots",
            unique_key="code",
            strategy="timestamp",
            updated_at="UPDATE_DATE",
        )
    }}

    select *
    from {{ ref("plants") }}

{% endsnapshot %}
