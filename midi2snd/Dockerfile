from ubuntu:focal as builder

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y build-essential cmake git pkg-config curl zip unzip tar && \
    mkdir /sf2 && curl --output /sf2/soundfont.sf2 https://matthewcpp-docker-resources.s3.us-west-1.amazonaws.com/weedsgm3.sf2 && \
    mkdir src && cd src && \
    git clone --recursive https://github.com/matthewcpp/midi2snd.git /src && \
    mkdir build && cd build && \
    cmake .. && \
    cmake --build . --config Release

from ubuntu:focal
RUN mkdir /src /dest /sf2

COPY --from=builder /src/build/midi2snd /opt/midi2snd
COPY --from=builder /sf2/soundfont.sf2 /sf2/soundfont.sf2
COPY entrypoint.sh /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]