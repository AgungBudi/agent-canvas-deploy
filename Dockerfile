FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl bash git python3 python3-dev gcc && \
    rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Belt: symlinks make uv/uvx available system-wide
RUN ln -sf /root/.local/bin/uv /usr/local/bin/uv && \
    ln -sf /root/.local/bin/uvx /usr/local/bin/uvx

# Suspenders: ENV PATH persists into CMD runtime and any subprocess spawned by agent-canvas
ENV PATH="/root/.local/bin:$PATH"

RUN npm install -g @openhands/agent-canvas

EXPOSE 8000
CMD ["agent-canvas", "--public"]