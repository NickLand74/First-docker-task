FROM golang:1.22.0

WORKDIR /app 

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o /my_app

CMD ["/my_app"]