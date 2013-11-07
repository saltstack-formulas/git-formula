include:
{% if pillar.get('git', {}).get('install_from_source') %}  
  - git.source
{% else %}
  - git.package
{% endif %}
