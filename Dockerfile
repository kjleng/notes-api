FROM golang:1.24.2-alpine

WORKDIR /app

COPY . . 

RUN go get -d -v ./...

RUN go build -o api .

#EXPOSE the port
EXPOSE 8000

# Run the executable
CMD ["./api"]
