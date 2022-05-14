# Camel Build Environment for Docker

This projects contains a Docker project for building releases of [Apache Camel](https://camel.apache.org).

## Prepare

Checkout this repository and copy the following files (not part of this repository) to the `private` subdirectory:

- `gitconfig_user`: Your Git configuration with options for `user.name` and `user.email`.
- `private.gpg`: Your GPG private key that will be used for signing build artifacts. Export the key from your machine with `gpg --output private.gpg --export-secret-key {KEY_ID}`.
- `settings.xml`: A Maven settings file with the Apache repositories as described in the [release guide](https://camel.apache.org/manual/latest/release-guide.html#ReleaseGuide-MavenSetup).
- `settings-security.xml`: If you encrypted your credentials in the `settings.xml` file, add the master key with this file.

## Building

Build the project with the following command:

```
docker-compose build
```

## Running

Run the the project with the following command:

```
docker-compose up -d
```

Create a shell into the running container:

```
docker-compose exec camel bash
```

Stop the container with:

```
docker-compose stop
```

Resume the container with:

```
docker-compose start
```

Remove everything:

```
docker-compose down
```