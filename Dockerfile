FROM ubuntu:latest

# 1. First install minimal Python and pip
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 2. Ensure pip is upgraded first
RUN python3 -m pip install --upgrade pip

# 3. Install PyYAML with explicit version
RUN python3 -m pip install PyYAML==6.0.1

# 4. Copy application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]