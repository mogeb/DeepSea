{% if grains.get('os', '') == 'CentOS' %}

install_ceph_repo:
  module.run:
    - name: pkg.install
    - m_name: centos-release-ceph
    - fire_event: True

install_ceph:
  module.run:
    - name: pkg.install
    - m_name: ceph
    - fire_event: True

{% else %}

ceph:
  pkg.latest:
    - pkgs:
      - ceph
    - dist-upgrade: True
    - fire_event: True

{% endif %}
