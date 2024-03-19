FROM golang:1.22.1-alpine3.19 as build

WORKDIR /app
COPY ./ ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o api

FROM alpine:3.19
COPY --from=build /app/api /main
ENTRYPOINT ["/main"]
