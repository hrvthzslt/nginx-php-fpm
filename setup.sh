#!/bin/sh

check_docker() {
  if ! command -v docker >/dev/null 2>&1; then
    echo "Docker is not installed. Please install docker first."
    exit 1
  fi
}

docker_compose_up() {
  if command -v docker compose >/dev/null 2>&1; then
    docker compose up -d
  elif command -v docker-compose >/dev/null 2>&1; then
    docker compose-up -d
  else
    echo "Docker compose is not installed. Please install docker compose first."
    exit 1
  fi
}

docker_host_manager() {
  docker run -d \
      --name docker-hostmanager \
      --restart=always \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v /etc/hosts:/hosts iamluc/docker-hostmanager \
      2>/dev/null
}

main() {
  check_docker
  docker_compose_up
  docker_host_manager
}

main
