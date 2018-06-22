{% set active_profile = salt['cmd.run']('tuned-adm active') %}

{% if 'ses-mon' in active_profile %}

fail:
  cmd.run:
    - name: "echo ses-mon profile is set"

{% else %}

prout:
  cmd.run:
    - name: "echo FAIL"
    - failhard: True
  fail wrong profile, expected ses-mon:
    - name: "Failed"

{% endif %}
