# Use a minimal base image
FROM alpine:latest

# Install curl to perform HTTP requests
RUN apk --no-cache add curl

# Copy the DuckDNS update script into the container
COPY providers/duckdns /usr/local/bin/duckdns-update.sh

# Make the script executable
RUN chmod +x /usr/local/bin/duckdns-update.sh

# Run the script in a loop
CMD ["sh", "-c", "while true; do /usr/local/bin/duckdns-update.sh; sleep ${UPDATE_INTERVAL:-300}; done"]
