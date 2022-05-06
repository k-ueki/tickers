FROM golang:1.15.7-alpine as builder

ENV ROOT=/go/src/app
WORKDIR ${ROOT}

RUN apk update && apk add git
COPY go.mod go.sum ./
RUN go mod download

RUN apk add --no-cache ca-certificates && update-ca-certificates

COPY . ${ROOT}
RUN CGO_ENABLED=0 GOOS=linux go build -o $ROOT/binary

FROM scratch as prod

ENV ROOT=/go/src/app
ENV SYSTEM_ENV="production"
WORKDIR ${ROOT}
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
#COPY --from=builder ${ROOT}/.env ${ROOT}/.env
COPY --from=builder ${ROOT}/binary ${ROOT}

EXPOSE 8080
CMD ["/go/src/app/binary"]
