FROM python:3.8-slim-buster

# Install the library for poetry build
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app

COPY poetry.lock .
COPY pyproject.toml .

# Install python lib via poetry
RUN pip install pip -U \
    && pip install --no-cache-dir poetry \
    && poetry install

CMD ["/bin/bash"]
