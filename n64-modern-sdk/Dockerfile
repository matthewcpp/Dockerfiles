FROM ubuntu:20.04

ENV PATH=/opt/crashsdk/bin:/etc/n64/usr/sbin:${PATH}
ENV ROOT=/etc/n64
ENV N64_LIBGCCDIR=/opt/crashsdk/lib/gcc/mips64-elf/11.2.0

WORKDIR /opt/crashsdk

RUN dpkg --add-architecture i386 && apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y build-essential git wget flex bison cmake && \
    echo "deb [trusted=yes] https://crashoveride95.github.io/apt ./" > /etc/apt/sources.list.d/crashoveride95.list && apt-get update && \
    apt-get install -y lib32z1 libc6:i386 && \
    apt-get install -y binutils-mips-n64 gcc-mips-n64 libgcc-mips-n64 root-compatibility-environment && \
    apt-get install -y n64sdk makemask spicy libnustd libnusys libnaudio libmus rsp-tools && \
    rm -rf /var/lib/apt/lists/*

COPY build_all_n64_examples.sh /
