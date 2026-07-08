FROM node:22-alpine

# python3-dev provides Python.h headers needed to compile tree-sitter
RUN apk add --no-cache curl bash git python3 python3-dev gcc musl-dev
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN ln -sf /root/.local/bin/uv /usr/local/bin/uv && \
    ln -sf /root/.local/bin/uvx /usr/local/bin/uvx

RUN npm install -g @openhands/agent-canvas

EXPOSE 8000
CMD ["agent-canvas", "--public"]