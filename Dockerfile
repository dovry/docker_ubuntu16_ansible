FROM ubuntu:xenial
LABEL maintainer="Dovry"
ENV container=docker
ENV script_url "https://raw.githubusercontent.com/dovry/ansible-install-script/master/ansible_convenience_script.sh"

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates wget \
  # Install ansible
  && wget --no-check-certificate -O - $script_url | bash -s -- -p \
  # Cleanup
  && rm -rf /var/lib/apt/lists* \
  && apt-get clean

COPY initctl_faker .
RUN chmod +x initctl_faker && rm -fr /sbin/initctl && ln -s /initctl_faker /sbin/initctl

VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]
CMD ["/lib/systemd/systemd"]
HEALTHCHECK CMD ansible --version