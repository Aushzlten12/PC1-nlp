# Python 3.11
FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive \
  PIP_NO_CACHE_DIR=1 \
  PYTHONDONTWRITEBYTECODE=1 \
  PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  git \
  build-essential \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash appuser
WORKDIR /app


COPY requirements.txt /app/requirements.txt
RUN python -m pip install --upgrade pip && pip install -r requirements.txt

COPY . /app


USER appuser


ENV PYTHONPATH=/app \
  MPLCONFIGDIR=/tmp \
  NUMBA_CACHE_DIR=/tmp \
  TMPDIR=/tmp

CMD ["python", "-c", "print('Container listo')"]
