FROM node:22-alpine

RUN apk add --no-cache curl bash git python3
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN ln -sf /root/.local/bin/uv /usr/local/bin/uv

RUN npm install -g @openhands/agent-canvas

EXPOSE 8000
CMD ["agent-canvas", "--public"]