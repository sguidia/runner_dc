#!/bin/bash

echo "script starting..."
# Run the registration command
gitlab-runner register \
  --non-interactive \
  --locked=false \
  --url=http://gitlab.lan/ \
  --token=glrt-hn4P4HzVw61NAj3xyqKT \
  --executor=docker \
  --docker-image=docker:20-dind \
  --description=docker-runner \
  --docker-volumes="/var/run/docker.sock:/var/run/docker.sock"

# Modify the config.toml to add extra_hosts after the [[runners]] section
sed -i '/\[\[runners\]\]/a\    [runners.docker]\n      extra_hosts = ["gitlab.lan:172.26.0.2"]' /etc/gitlab-runner/config.toml