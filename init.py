import os
with open('go.sh', 'w') as output:
    print(f"echo {os.environ['FLAVOR']}", file=output)
