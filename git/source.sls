{% set git = pillar.get('git', {}) -%}
{% set version = git.get('version', '1.8.4.2') -%}
{% set checksum = git.get('checksum', 'sha1=f2e9317703553b4215700605c15d0f3a30623a9d') -%}
{% set source = git.get('source_root', '/usr/local/src') -%}

{% set git_package = source + '/git-' + version + '.tar.gz' -%}

get-git:
  pkg.installed:
      - names:
        - libcurl4-openssl-dev 
        - libexpat1-dev 
        - gettext 
        - libz-dev 
        - libssl-dev
        - build-essential
  file.managed:
    - name: {{ git_package }}
    - source: https://git-core.googlecode.com/files/git-{{ version }}.tar.gz
    - source_hash: {{ checksum }}
  cmd.wait:
    - cwd: {{ source }}
    - name: tar -zxf {{ git_package }}
    - require:
      - pkg: get-git
    - watch:
      - file: get-git

git:
  pkg.removed:
    - name: git
  cmd.wait:
    - cwd: {{ source + '/git-' + version }}
    - name: make prefix=/usr/local all && make prefix=/usr/local install
    - watch:
      - cmd: get-git
    - require:
      - cmd: get-git
