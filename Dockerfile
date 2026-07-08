FROM node:22-bookworm-slim

# python3-dev + gcc needed to compile tree-sitter C extension at runtime
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl bash git python3 python3-dev gcc && \
    rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN ln -sf /root/.local/bin/uv /usr/local/bin/uv && \
    ln -sf /root/.local/bin/uvx /usr/local/bin/uvx

RUN npm install -g @openhands/agent-canvas

EXPOSE 8000
CMD ["agent-canvas", "--public"]