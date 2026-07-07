```dockerfile
FROM node:22-alpine

# Install uv (Python runtime required by the agent server)
RUN apk add --no-cache curl bash git python3
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:$PATH"

# Install Agent Canvas globally
RUN npm install -g @openhands/agent-canvas

EXPOSE 8000
CMD ["agent-canvas", "--public"]