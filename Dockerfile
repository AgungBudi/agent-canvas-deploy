FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl bash git python3 python3-dev gcc && \
    rm -rf /var/lib/apt/lists/*

# Install uv and uvx directly into /usr/local/bin (always on PATH, no symlinks needed)
RUN curl -LsSf https://astral.sh/uv/install.sh | UV_INSTALL_DIR=/usr/local/bin sh

RUN npm install -g @openhands/agent-canvas

EXPOSE 8000
CMD ["agent-canvas", "--public"]