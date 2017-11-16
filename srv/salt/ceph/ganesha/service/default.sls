{% if grains.get('os', '') == 'CentOS' %}

start-ganesha:
  cmd.run:
    - name: "/usr/bin/ganesha.nfsd -L /var/log/ganesha/ganesha.log -f /etc/ganesha/ganesha.conf -N NIV_EVENT"
    - shell: /bin/bash

{% else %}

start-ganesha:
  cmd.run:
    - name: "systemctl restart nfs-ganesha"
    - shell: /bin/bash

enable-ganesha:
  cmd.run:
    - name: "systemctl enable nfs-ganesha"
    - shell: /bin/bash

{% endif %}