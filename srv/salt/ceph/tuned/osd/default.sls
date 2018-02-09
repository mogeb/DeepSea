/usr/lib/tuned/ses-osd/tuned.conf:
  file.managed:
    - source: salt://ceph/tuned/ses-osd/tuned.conf
    - makedirs: True
    - user: root
    - group: root
    - mode: 644

apply tuned ses osd:
  cmd.run:
    - name: "tuned-adm profile ses-osd"

start-tuned:
  cmd.run:
    - name: "systemctl start tuned"

enable-tuned:
  cmd.run:
    - name: "systemctl enable tuned"
