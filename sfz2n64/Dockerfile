FROM golang:latest as builder
COPY ./make_sound_effect_bank.sh /go/make_sound_effect_bank.sh
RUN git clone https://github.com/lambertjamesd/sfz2n64 "/go/src/github.com/lambertjamesd/sfz2n64" && \
    cd "/go/src/github.com/lambertjamesd/sfz2n64" && \
    GO111MODULE=off go build -o sfz2n64 *.go

from alpine:latest
COPY --from=builder /go/src/github.com/lambertjamesd/sfz2n64/sfz2n64 /go/make_sound_effect_bank.sh ./
RUN mkdir /workspace && chmod +x /make_sound_effect_bank.sh
