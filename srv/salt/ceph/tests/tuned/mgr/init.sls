{% set active_profile = salt['cmd.run']('tuned-adm active') %}

{% if 'ses-mgr' in active_profile %}

fail:
  cmd.run:
    - name: "echo ses-mgr profile is set"

{% else %}

prout:
  cmd.run:
    - name: "echo FAIL"
    - failhard: True
  fail wrong profile, expected ses-mgr:
    - name: "Failed"

{% endif %}
