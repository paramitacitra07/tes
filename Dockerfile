FROM python:3.12-slim

WORKDIR /workspace

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    curl \
    jq \
    unzip \
    git \
    awscli \
    && rm -rf /var/lib/apt/lists/*

COPY miawu.sh /opt/ml/processing/input/miawu.sh
RUN chmod +x /opt/ml/processing/input/miawu.sh

ENTRYPOINT ["/bin/bash", "/opt/ml/processing/input/miawu.sh"]
