FROM golang:latest as buildgolang
RUN git clone https://github.com/lambertjamesd/sfz2n64 "/go/src/github.com/lambertjamesd/sfz2n64" && \
    cd "/go/src/github.com/lambertjamesd/sfz2n64" && \
    GO111MODULE=off go build -o sfz2n64 *.go

from alpine:latest as buildcpp
COPY ./snd2aiff /snd2aiff
RUN apk update && apk add --no-cache autoconf build-base binutils cmake curl file gcc git libgcc libtool linux-headers make musl-dev tar unzip wget python3 py3-pip && \
    pip install conan && \
    export PATH=~/.local/bin:$PATH && \
    cd snd2aiff && \
    mkdir build && cd build && \
    conan install .. --build=* && \
    cmake .. && \
    make

from alpine:latest
COPY ./make_sound_effect_bank.sh ./
COPY --from=buildgolang /go/src/github.com/lambertjamesd/sfz2n64/sfz2n64 ./
COPY --from=buildcpp /snd2aiff/build/snd2aiff ./
RUN mkdir /workspace && chmod +x /make_sound_effect_bank.sh
