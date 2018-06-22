Check tuned for ses-mon roles:
  salt.state:
    - tgt: "I@roles:mon and not I@roles:storage"
    - tgt_type: compound
    - sls: ceph.tests.tuned.mon

