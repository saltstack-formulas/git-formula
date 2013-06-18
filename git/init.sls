git:
  pkg.installed:
    {% if grains['os'] == 'Ubuntu' %}
    - name: git-core
    {% else -%}
    - name: git
    {% endif -%}
