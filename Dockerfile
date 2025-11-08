FROM apache/airflow:3.1.2
USER root
# Install system packages (libxml2-dev and libxslt-dev) as root.
# Combine into a single layer and clean up to reduce image size.
RUN apt-get update && apt-get install -y --no-install-recommends \
    libxml2-dev libxslt-dev \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
USER airflow
COPY requirements.txt /
# Install Python packages as the 'airflow' user with the --user flag
# so they are installed in a user-owned directory.
# The `apache-airflow` package does not need to be reinstalled.
RUN pip install --no-cache-dir -r /requirements.txt

# Switch back to the airflow user for final build layers and runtime
USER airflow