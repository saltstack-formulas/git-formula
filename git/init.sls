{%- from "git/map.jinja" import git_settings with context %}

include:
{%- if git_settings.install_from_source %}
  - git.source
{%- else %}
  - git.package
{%- endif %}
