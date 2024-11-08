# Skeleton Symfony 7 + PHP 8.3 + PostgreSql 16


# DevContainer
## 1. Usage
1. Copy the `.devcontainer` folder into root of your Symfony project.
2. Open the project in Visual Studio Code.
3. Click on the green icon in the bottom left corner and select `Reopen in Container`.
4. ... Profit!

## 2. Ports forwarding
By default, the containers forward the following ports:

- The `dev` service in the `compose.yml` file forwards the `8000` port from the PHP container to the host machine. You can change the port by modifying the `ports` field in the `dev` service.

- The `mailer` service forwards the `8025` port from the Mailer container to the host machine. You can change the port by modifying the `ports` field in the `mailer` service.

## 3. Features
Symfony DevContainer comes with tree containers:

- PHP 8.3 (from official Docker image php:8.3-cli) with
  - Composer
  - Symfony CLI
  - Some PHP extensions (e.g. xdebug, intl, pdo_pgsql)
- PostgreSQL 16 (from official Docker image postgres:16-alpine)
- Mailer (from axllent/mailpit)

## 4. Customization
You can customize the containers by editing the `.devcontainer/compose.yml` file.

If you need to install additional PHP extensions or specific versions of software :
- Modify the `Dockerfile`, build and push the image to your Docker registry.
- Update the `image` field in the `dev` service in the `compose.yml` file.
- Rebuild : `docker build -t florianfish35/symfony-7-php8.3-postgresql-16-dev-container . --no-cache`
- Push to dockerhub : `docker push florianfish35/symfony-7-php8.3-postgresql-16-dev-container:latest`
