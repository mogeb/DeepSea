/usr/lib/tuned/ses-mon/tuned.conf:
  file.managed:
    - source: salt://ceph/tuned/ses-mon/tuned.conf
    - makedirs: True
    - user: root
    - group: root
    - mode: 644

apply tuned ses mon:
  cmd.run:
    - name: "tuned-adm profile ses-mon"

start-tuned:
  cmd.run:
    - name: "systemctl start tuned"

enable-tuned:
  cmd.run:
    - name: "systemctl enable tuned"
