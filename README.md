# Airflow for Homelab

A small, self-contained Apache Airflow setup tuned for homelab use. It runs with Docker Compose and is easy to extend with custom DAGs and plugins.

## Prerequisites

Before you begin, ensure you have Docker and Docker Compose installed on your system.

- **Docker Engine**: Follow the official instructions to [install Docker](https://docs.docker.com/engine/install/).
- **Docker Compose**: Follow the official guide to [install Docker Compose](https://docs.docker.com/compose/install/).

### Post-installation steps for Linux

After installing Docker, you'll need to manage Docker as a non-root user.

1.  Create the `docker` group if it doesn't already exist:
    ```sh
    sudo groupadd docker
    ```

2.  Add your user to the `docker` group:
    ```sh
    sudo usermod -aG docker $USER
    ```

3.  For the changes to take effect, log out and log back in, or run the following command to activate the changes for the current terminal session:
    ```sh
    newgrp docker
    ```

## Getting Started

1.  **Build the Docker Image**

    This step is only necessary if you have made changes to the `Dockerfile` or prefer to build the image locally.
    ```sh
    docker build . -f Dockerfile --pull --tag homelab-airflow:0.0.1
    ```

2.  **Initialize Airflow**

    This command initializes the database, creates a default user, and sets up necessary resources.
    ```sh
    docker compose up airflow-init
    ```

3.  **Start Airflow Services**

    Run all Airflow services (webserver, scheduler, etc.) in the background.
    ```sh
    docker compose up -d
    ```

## Accessing the Web UI

-   **URL**: [http://localhost:8080](http://localhost:8080)
-   **Username**: `airflow`
-   **Password**: `airflow`

*Note: The default credentials are set during the `airflow-init` step. You can change them in the `docker-compose.yml` file or by setting environment variables.*

## Project Structure

-   `Dockerfile`: Defines the custom Airflow image.
-   `docker-compose.yml`: Orchestrates the Airflow services.
-   `dags/`: Place your DAG Python files here. They will be automatically loaded by Airflow.
-   `plugins/`: Add any custom Airflow plugins (operators, hooks, etc.) to this directory.
-   `.env`: Used for managing environment variables for the Docker Compose setup.

## Troubleshooting

If containers fail to start or you encounter issues, check the service logs:
```sh
docker compose logs --follow
```

If you make changes to the metadata database or secrets, you may need to re-run the initialization:
```sh
docker compose up airflow-init
```

## Cleanup

To stop and remove all containers, networks, and volumes, run the following command:
```sh
docker compose down --volumes --rmi all
```
