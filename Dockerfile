FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl bash git python3 python3-dev gcc && \
    rm -rf /var/lib/apt/lists/*

RUN ARCH=$(uname -m) && \
    curl -fsSL "https://github.com/astral-sh/uv/releases/latest/download/uv-${ARCH}-unknown-linux-musl.tar.gz" \
    | tar xz -C /usr/local/bin && \
    chmod +x /usr/local/bin/uv /usr/local/bin/uvx

RUN npm install -g @openhands/agent-canvas

EXPOSE 8000
CMD ["agent-canvas", "--public"]