/usr/lib/tuned/ses-mgr/tuned.conf:
  file.managed:
    - source: salt://ceph/tuned/ses-mgr/tuned.conf
    - makedirs: True
    - user: root
    - group: root
    - mode: 644

apply tuned ses mgr:
  cmd.run:
    - name: "tuned-adm profile ses-mgr"

start-tuned:
  cmd.run:
    - name: "systemctl start tuned"

enable-tuned:
  cmd.run:
    - name: "systemctl enable tuned"
