{% if grains.get('os', '') == 'CentOS' %}

install_alertmanager:
  pkg.installed:
    - name: alertmanager
    - refresh: True
    - fire_event: True

start alertmanager service:
  service.running:
    - name: alertmanager
    - enable: True

{% elif grains.get('os_family', '') == 'Debian' %}

install_alertmanager:
  pkg.installed:
    - name: prometheus-alertmanager
    - refresh: True
    - fire_event: True

start alertmanager service:
  service.running:
    - name: prometheus-alertmanager
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
