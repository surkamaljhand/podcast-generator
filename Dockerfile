FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  git

# Install Python dependencies
RUN pip3 install pyYAML

# Copy feed.py to /usr/bin
COPY feed.py /usr/bin/feed.py

# Copy entrypoint.sh to root
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint.sh executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
