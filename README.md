# wp-cli-docker
Docker environment for [WP-CLI](https://make.wordpress.org/cli/) contributors.

# Installation
## Prior Preparation
- Clone related repositories into your local `~/wp-cli`
    - Follow [these steps](https://make.wordpress.org/cli/handbook/contributions/pull-requests/#working-on-the-project-as-a-whole)
  
## Setup
```
$ docker compose up -d --build
```

Now you can login to `wp-cli` container.
```
% docker exec -it wp-cli bash
```
