FROM resin/rpi-raspbian:jessie
MAINTAINER Peter Peterson <jedipetey@gmail.com>
LABEL Description="Base python3 and openzwave container" Version="1.0"

WORKDIR /usr/src/python_openzwave

COPY build_python_openzwave /usr/src/python_openzwave/build_python_openzwave

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-dev python3-pip cython3 libudev-dev git make g++ gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    /usr/src/python_openzwave/build_python_openzwave && \
    mkdir -p /usr/local/share/python-openzwave && \
    ln -sf /usr/src/python_openzwave/build/python-openzwave/openzwave/config /usr/local/share/python-openzwave/config

CMD ["bash"]


