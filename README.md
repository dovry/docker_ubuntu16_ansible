# [Docker Ubuntu 16.04 Ansible](https://hub.docker.com/repository/docker/dovry/docker_ubuntu16_ansible)

![Build Status](https://github.com/dovry/docker_ubuntu16_ansible/workflows/Basic%20build%20and%20push%20to%20Docker%20hub/badge.svg)

![Docker Pulls](https://img.shields.io/docker/pulls/dovry/docker_ubuntu16_ansible)

Test Ansible roles in an Ubuntu 16.04 container

## How to use the container

```yaml
docker run --rm -d -it \
--name ubuntu16_ansible \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /run/lock:/run/lock:ro \
-v /etc/ansible:/etc/ansible:ro \
dovry/docker_ubuntu16_ansible:latest
```

And then either exec into the container and start hacking away with:

`docker exec -it ubuntu16_ansible /bin/bash`

or execute a role directly with a command such as this:

`docker exec -it ubuntu16_ansible ansible-playbook /etc/ansible/playbooks/test-role.yml`

Remember to set the target host in the playbook so that it is run in the container

`hosts: localhost`
