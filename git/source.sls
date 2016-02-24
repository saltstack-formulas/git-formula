{%- from "git/map.jinja" import git_settings with context %}
{%- set git_src = git_settings.source_install %}
{%- set git_package = git_src.source_root ~ '/git-' ~ git_src.version ~ '.tar.gz' %}

get-git:
  pkg.installed:
    - names:
{%- for install_dep in git_src.pkg_deps %}
      - {{ install_dep }}
{%- endfor %}
  file.managed:
    - name: {{ git_package }}
    - source: https://www.kernel.org/pub/software/scm/git/git-{{ git_src.version }}.tar.gz
    - source_hash: {{ git_src.checksum }}
  cmd.wait:
    - cwd: {{ git_src.source_root }}
    - name: tar -zxf {{ git_package }}
    - require:
      - pkg: get-git
    - watch:
      - file: get-git

git:
{%- if git_src.remove_system_package %}
  pkg.removed:
    - name: {{ git_settings.git }}
{%- endif %}
  cmd.wait:
    - cwd: {{ git_src.source_root + '/git-' + git_src.version }}
    - name: make prefix={{ git_src.install_prefix }} all && make prefix={{ git_src.install_prefix }} install
    - watch:
      - cmd: get-git
    - require:
      - cmd: get-git
