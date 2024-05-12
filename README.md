# Portfolio Manager Client

## Usage

To run the API using Docker, follow these steps:

1. Build the Docker image:

    ```bash
    docker build -t portfolio_manager_client .
    ```

2. Run the Docker container:

    ```bash
    docker run -p 8080:8080 --name portfolio-client-container portfolio_manager_client
    ```

    This command will start the API container and expose it on port 3000.
