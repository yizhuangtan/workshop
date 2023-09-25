
FROM golang:1.21-alphine3.18 AS builder

WORKDIR /app

COPY go.mod . 
COPY go.sum .
COPY main.go .

RUN CGO_ENABLED=1 go build -o main ./...

FROM alpine:3.18

WORKDIR /app

COPY --from=builder /app/main .
COPY public public
COPY templates templates

RUN apk add build-base

ENV PORT=3000 INSTANCE_NAME="dov_bear" INSTANCE_HASH="abc123"


HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \ 
    CMD curl -X GET -sf http://localhost:${PORT}/healthz || exit 1

EXPOSE ${PORT}

ENTRYPOINT /app/main
