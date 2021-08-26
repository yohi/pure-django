FROM python:3.9-slim

RUN apt update \
    && apt -y upgrade --no-install-recommends \
    && apt install -y \
    mariadb-client \
    build-essential \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

ENV PYTHONUNBUFFERED 1

WORKDIR /code
RUN pip install --upgrade pip
RUN pip install Django'>=3.0,<4.0'
