FROM golang:1-alpine
LABEL maintainer="me@httgp.com"

ENV GOOS linux
RUN apk add --no-cache git \
    && go get -d github.com/mhausenblas/burry.sh

WORKDIR $GOPATH/src/github.com/mhausenblas/burry.sh
RUN go build -ldflags="-s -w"

FROM alpine:3.8
RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
    ca-certificates \
    && update-ca-certificates 2>/dev/null || true
COPY --from=0 /go/src/github.com/mhausenblas/burry.sh/burry.sh /usr/local/bin/burry

ENTRYPOINT ["/usr/local/bin/burry"]
CMD ["--help"]
