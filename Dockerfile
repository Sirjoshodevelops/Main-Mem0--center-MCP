FROM python:3.12-slim

ENV PORT=8080

WORKDIR /app

# Install uv
RUN pip install uv

# Copy your code
COPY . .

# Install dependencies globally (inside container)
RUN uv pip install -e .

EXPOSE ${PORT}

CMD ["uv", "run", "src/main.py"]
