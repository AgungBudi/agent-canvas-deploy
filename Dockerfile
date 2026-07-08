FROM node:22-alpine

# gcc + musl-dev needed to compile tree-sitter C extension
RUN apk add --no-cache curl bash git python3 gcc musl-dev
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN ln -sf /root/.local/bin/uv /usr/local/bin/uv && \
    ln -sf /root/.local/bin/uvx /usr/local/bin/uvx

RUN npm install -g @openhands/agent-canvas

EXPOSE 8000
CMD ["agent-canvas", "--public"]