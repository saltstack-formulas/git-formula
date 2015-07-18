{% from "git/map.jinja" import git with context %}

{% if grains['os'] == 'Ubuntu' %}
git_repo:
  pkgrepo.managed:
    - humanname: git-ppa-{{ grains['oscodename'] }}
    - name: deb http://ppa.launchpad.net/git-core/ppa/ubuntu {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/git-{{ grains['oscodename'] }}.list
    - dist: {{ grains['oscodename'] }}
    - keyid: E1DF1F24
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: git
{% endif %}

git:
  pkg.installed:
    - name: {{ git.get('git', 'git') }}
