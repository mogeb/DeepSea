{% set active_profile = salt['cmd.run']('tuned-adm active') %}

{% if 'ses-osd' in active_profile %}

fail:
  cmd.run:
    - name: "echo ses-osd profile is set"

{% else %}

prout:
  cmd.run:
    - name: "echo FAIL"
    - failhard: True
  fail wrong profile, expected ses-osd:
    - name: "Failed"

{% endif %}
