{% if 'master' in salt['pillar.get']('roles') %}

{% if grains.get('os', '') == 'CentOS' %}

ceph_exporter_repo_CentOS:
  pkgrepo.managed:
    - name: centos-ceph-exporter-repo
    - humanname: CentoOS-$releasever - ceph_exporter
    - baseurl: https://copr-be.cloud.fedoraproject.org/results/rjdias/home/epel-7-$basearch/
    - gpgcheck: False
    - enabled: True
    - fire_event: True

{% endif %}

ceph exporter package:
  pkg.installed:
    - name: golang-github-digitalocean-ceph_exporter
    - fire_event: True

start ceph exporter:
  service.running:
    - name: prometheus-ceph_exporter
    - enable: True
{% endif %}
