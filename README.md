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