{%- from "git/map.jinja" import git_settings with context %}

{%- if git_settings.install_pkgrepo %}
include:
  - git.pkgrepo
{%- endif %}

git:
  pkg.installed:
    - name: {{ git_settings.git }}
