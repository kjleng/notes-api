FROM golang:1.24.2-alpine AS builder

# Set working directory
WORKDIR /app

# Install dependencies including make
RUN apk add --no-cache git make

# Copy the entire project
COPY . .

# Build using make
RUN make install

# Use a small alpine image for the final image
FROM alpine:3.19

# Install ca-certificates for HTTPS
RUN apk --no-cache add ca-certificates

WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/notes-api .

# Copy the .env file from the builder stage
COPY --from=builder /app/.env .

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["./notes-api"]
