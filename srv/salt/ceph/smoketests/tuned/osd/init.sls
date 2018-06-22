Check tuned for ses-osd roles:
  salt.state:
    - tgt: "I@roles:storage"
    - tgt_type: compound
    - sls: ceph.tests.tuned.osd

