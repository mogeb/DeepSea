{% if grains.get('os_family', '') == 'RedHat' %}

install_alertmanager:
  pkg.installed:
    - name: alertmanager
    - refresh: True
    - fire_event: True

start alertmanager service:
  service.running:
    - name: alertmanager
    - enable: True

{% else %}

golang-github-prometheus-alertmanager:
  pkg.installed:
    - fire_event: True
    - refresh: True

start prometheus-alertmanager:
  service.running:
    - name: prometheus-alertmanager
    - enable: True

{% endif %}