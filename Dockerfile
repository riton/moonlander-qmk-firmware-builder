FROM ubuntu:23.04

RUN apt update && \
apt upgrade -y && \
apt install -y git python3-pip python3-venv sudo && \
python3 -m venv /opt/qmk-venv && \
/opt/qmk-venv/bin/pip install --upgrade pip wheel

RUN apt install -y build-essential clang-format diffutils gcc git unzip wget zip python3-pip binutils-avr gcc-avr avr-libc binutils-arm-none-eabi gcc-arm-none-eabi

RUN /opt/qmk-venv/bin/pip install qmk

RUN /opt/qmk-venv/bin/qmk setup --home /home/ubuntu/qmk_firmware zsa/qmk_firmware -b firmware22 --yes

RUN chown -R ubuntu:ubuntu /home/ubuntu

ADD ./entrypoint.sh /entrypoint.sh
ADD ./build_command.sh /build-firmware.sh

RUN chmod 0755 /entrypoint.sh /build-firmware.sh

USER ubuntu:ubuntu

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/build-firmware.sh"]
