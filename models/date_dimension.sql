with CTE as (
    select to_timestamp(STARTED_AT) as STARTED_AT,
    date(to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
    HOUR(to_timestamp(STARTED_AT)) as HOUR_STARTED_AT,

    CASE WHEN
        dayname(to_timestamp(STARTED_AT)) IN ('sat','sun')
            then 'weekend'
        else 'businessday'
        end as DAY_TYPE,

    case 
        when month(to_timestamp(STARTED_AT)) in (12,1,2)
            then 'winter'
        when month(to_timestamp(STARTED_AT)) in (3,4,5)
            then 'spring'
        when month(to_timestamp(STARTED_AT)) in (6,7,8)
            then 'summer'
        else 'autumn'
        end as STATION_OF_YEAR

    from {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)

select * from CTE