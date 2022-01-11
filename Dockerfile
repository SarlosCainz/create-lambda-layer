FROM amazonlinux:latest

RUN set -eu \
 && yum install -y python3 zip \
 && yum clean all

ENV BUILD_DIR /build
WORKDIR $BUILD_DIR

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["build"]
