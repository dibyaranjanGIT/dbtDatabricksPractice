{% set var_name = 'dibyaranajn jena' %}

{{ var_name }}

{%- set apples = [
    'red delicious',
    'granny smith',
    'honeycrisp',
    'mcintosh',
    'pink lady'
] -%}


{% for apple in apples %}
{% if apple != 'honeycrisp' %}
    {{ apple }}
{%else%}
    I hate {{ apple }}
{% endif %}
{% endfor %}