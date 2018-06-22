Check tuned for ses-mgr roles:
  salt.state:
    - tgt: "I@roles:mgr and not I@roles:storage and not I@roles:mon"
    - tgt_type: compound
    - sls: ceph.tests.tuned.mon

