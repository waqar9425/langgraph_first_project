# ---------- base ----------
FROM python:3.10-slim AS base

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app
COPY tests ./tests

# ---------- test ----------
FROM base AS test
CMD ["pytest", "-q"]

# ---------- runtime ----------
FROM base AS runtime
CMD ["python", "-m", "app.main"]
