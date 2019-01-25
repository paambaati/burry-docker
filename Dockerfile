FROM golang:1-alpine
LABEL maintainer="me@httgp.com"

ENV GOOS linux
RUN apk add --no-cache git \
    && go get -d github.com/mhausenblas/burry.sh

WORKDIR $GOPATH/src/github.com/mhausenblas/burry.sh
RUN go build -ldflags="-s -w"
RUN mv burry.sh burry

ENTRYPOINT ["./burry"]
CMD ["--help"]
