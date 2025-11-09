# Airflow for Homelab

## Build docker image:

```
docker build . -f Dockerfile --pull --tag homelab-airflow:0.0.1
```

## Initialize Airflow DB and resources:
```
docker compose up airflow-init
```

## Start Airflow:
```
docker compose up -d
```

## Clean up:
```
docker compose down --volumes --rmi all
```

## Docker pre-requisites

### Install Docker
```
sudo snap install docker
```

### Create the docker group if it does not exist:
```
sudo groupadd docker
```

### Add your user to the docker group:
```
sudo usermod -aG docker $USER
```

```
sudo chmod 666 /var/run/docker.sock
```

## About this repository

Purpose: a small, self-contained Apache Airflow setup tuned for homelab use — runnable with Docker Compose and easy to extend with custom DAGs and plugins.

What you'll find here:
- Dockerfile and docker-compose.yml to build and run Airflow services.
- dags/ — place your DAG Python files here.
- plugins/ — custom operators, hooks and UI components.
- scripts/ or entrypoint helpers (if present) used during container init.
- README.md — this file with quick start and repo details.

Quick start (summary)
1. Build the image (optional if using the published image):
   docker build . -f Dockerfile --pull --tag homelab-airflow:0.0.1
2. Initialize Airflow DB and resources:
   docker compose up airflow-init
3. Start the stack:
   docker compose up -d
4. Stop and clean:
   docker compose down --volumes --rmi all

Accessing the web UI:
- Airflow webserver is exposed on port 8080 by default: http://localhost:8080
- Default credentials may be created during airflow-init; check docker-compose and environment variables.

Configuration notes
- Environment variables can be set in the compose file or an .env file.
- Ensure your user is in the docker group and the docker socket is accessible (see prereqs in this README).
- Ports and volumes are defined in docker-compose.yml; modify as needed for your homelab network.

Troubleshooting
- If containers fail to start, check logs:
  docker compose logs --follow
- Re-run initialization when changing metadata DB or secrets:
  docker compose up airflow-init
