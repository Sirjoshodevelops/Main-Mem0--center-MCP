FROM python:3.12-slim

# Railway injects PORT at runtime
ENV PORT=8080

WORKDIR /app

# Install uv
RUN pip install uv

# Copy the MCP server files
COPY . .

# Install dependencies in a virtual environment
RUN python -m venv .venv
RUN .venv/bin/uv pip install -e .

# Expose the runtime port (Railway listens here)
EXPOSE ${PORT}

# Run the app on the correct port
CMD [".venv/bin/uv", "run", "src/main.py"]
