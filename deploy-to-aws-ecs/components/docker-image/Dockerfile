FROM golang:1.21.1

WORKDIR /app
COPY ./ ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /api

HEALTHCHECK --interval=35s --timeout=4s CMD curl -f localhost:8080/livez || exit 1
EXPOSE 8080
CMD ["/api"]
