FROM golang:1
LABEL maintainer="me@httgp.com"

ENV GOOS linux

RUN echo $GOPATH

RUN go get github.com/mhausenblas/burry.sh
WORKDIR $GOPATH/src/github.com/mhausenblas/burry.sh
RUN go build
RUN mv burry.sh burry

ENTRYPOINT ["./burry"]
