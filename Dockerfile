ARG BASE_IMAGE=senzing/senzing-base:1.5.5
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2021-03-16

LABEL Name="senzing/g2configtool" \
      Maintainer="support@senzing.com" \
      Version="1.4.2"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Run as "root" for system installation.

USER root

# Copy files from repository.

COPY ./rootfs /

# Make non-root container.

USER 1001

# Runtime execution.

WORKDIR /opt/senzing/g2/python
ENTRYPOINT ["/opt/senzing/g2/python/G2ConfigTool.py"]
