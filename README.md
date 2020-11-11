# Some general notes on Ansible


## YAML Syntax checking

### Correct Syntax

```
[devops@ansible]$ cat playbook.yml
---
- one
- two
...
```

1. YAMLLINT

```
[devops@ansible]$ yamllint playbook.yml
[devops@ansible]$
```

2. PYTHON
```
[devops@ansible]$ python -c 'import yaml, sys; print yaml.load(sys.stdin)' < playbook.yml
['one', 'two']
```

3. --SYNTAX-CHECK (very strict)
```
[devops@ansible]$ ansible-playbook playbook.yml --syntax-check
playbook: playbook.yml
```


### Incorrect Syntax

```
[devops@ansible]$ cat playbook.yml
---
- one
-two
...
```

1. YAMLLINT
```
[devops@ansible]$ yamllint playbook.yml
playbook.yml
  4:1       error    syntax error: could not find expected ':' (syntax)
```

2. PYTHON
```
[devops@bastion 1 ~/ansible_implementation]$ python -c 'import yaml, sys; print yaml.load(sys.stdin)' < playbook.yml
Traceback (most recent call last):
  File "<string>", line 1, in <module>
  File "/usr/lib64/python2.7/site-packages/yaml/__init__.py", line 71, in load
...
```

3. --SYNTAX-CHECK (very strict)
```
[devops@ansible] $ ansible-playbook playbook.yml --syntax-check
ERROR! playbook entries must be either a valid play or an include statement
...
```
