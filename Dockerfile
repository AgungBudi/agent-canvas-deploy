FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl bash git python3 python3-dev gcc && \
    rm -rf /var/lib/apt/lists/*

# Download uv + uvx directly from GitHub releases into /usr/local/bin.
# musl-static build — no glibc dependency, works on any Linux.
RUN ARCH=$(uname -m) && \
    curl -fsSL "https://github.com/astral-sh/uv/releases/latest/download/uv-${ARCH}-unknown-linux-musl.tar.gz" \
    | tar xz -C /usr/local/bin && \
    chmod +x /usr/local/bin/uv /usr/local/bin/uvx

RUN npm install -g @openhands/agent-canvas

EXPOSE 8000
CMD ["agent-canvas", "--public"]