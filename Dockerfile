FROM golang:alpine AS builder
WORKDIR /go/src/app
COPY . .
RUN go build main.go

FROM scratch
COPY --from=builder /go/src/app/main .
CMD [ "./main" ]
