# Docker Compose Documentation

Refer to official Docker compose [documentation](https://docs.docker.com/compose/)

## Explained

````yaml
services:

  # service name
  app:
    # Specify a custom container name
    container_name: vue-app
    # Configuration options that are applied at build time.
    build:
      # Path to a directory containing a Dockerfile
      context: app
      # Alternate Dockerfile.
      dockerfile: Dockerfile
    # What container ports are exposed?
    ports:
      # HOST:CONTAINER
      - "8000:8080"
    networks:
      # Custom Network
      serveriry:
        # Static (unchangeable) IPv4 Address
        ipv4_address: 10.10.0.2
    # Express dependency between services.
    depends_on:
      - directus
    # Add environment variables from a file.
    env_file:
      - ./.env.dev.db
    # Mount host paths or named volumes, specified as sub-options to a service.
    volumes:
      - ./uploads:/directus/uploads
````