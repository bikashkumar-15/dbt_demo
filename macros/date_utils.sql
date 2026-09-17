{% macro get_session(x) %}
case 
        when month(to_timestamp({{x}})) in (12,1,2)
            then 'winter'
        when month(to_timestamp({{x}})) in (3,4,5)
            then 'spring'
        when month(to_timestamp({{x}})) in (6,7,8)
            then 'summer'
        else 'autumn'
        end 
{% endmacro %}

{% macro day_type(x)%}
CASE WHEN
        dayname(to_timestamp({{x}})) IN ('sat','sun')
            then 'weekend'
        else 'businessday'
        end 
{% endmacro%}