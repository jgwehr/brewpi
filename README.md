[![GitHub Activity][commits-shield]][commits]


# Technology

| Infrastructure | Networking | Brewing |
| :-: | :-: |  :-:  |
| Dozzle |  Pihole   |  TiltPi |
| Socket Proxy |  Unbound  |  |


### Notes
Watchtower is intentionally avoided based off advice from the Selfhosted.show podcast. The idea is to have full control over the versions of containers (rather than automated updates) to improve reliability.

# Setup and Operation

## Starting services


# Project Structure
Work in Progress. Recommendations via *[multiple docker files](https://nickjanetakis.com/blog/docker-tip-87-run-multiple-docker-compose-files-with-the-f-flag)*, [Where to Put Docker Compose](https://nickjanetakis.com/blog/docker-tip-76-where-to-put-docker-compose-projects-on-a-server) *[TRaSH Guides](https://trash-guides.info/Hardlinks/How-to-setup-for/Docker/)*

## File System

```
├── /opt
│  └── docker/
│     └── brewpi/ (this repo)
|        ├── scripts/ (these help you setup or update the repo)
│        |  ├── run-each-update.sh (when you pull a new version)
│        |  └── run-once.sh (for initial setup)
|        ├── services/ (modular docker-compose files)
│        |  ├── infra-docker/ (a collection of services which work with, or depend on, one another)
│        |  |   ├── configtemplates/ (examples which need to be copied to your config folder, then modified)
│        |  |   ├── dockerfiles/ (build files)
│        |  |   ├── staticconfig/ (configuration the image uses which do NOT need modification)
│        |  |   ├── docker-compose.yml
│        |  |   └── [sym] .env (a symbolic link to the repos primary .env file. This allows easy maintenance within Docker's limitations. It is created by a script)
│        |  └── ...
│        └── .env.template (an example which should be copied, then modified)
├── /srv
│  ├── docker (for container's configurations)
│  ├── cache
│  └── logs
└── /data
   ├── db
   └── staticfiles
```

### Docker Compose (and needed files)
`/opt`
*explanation: reserved for the installation of add-on application software packages*

This github repo represents this folder. It's safely committed to public repos and shouldn't contain anything sensitive.

Example files:
- ./docker-compose.yml
- ./.env
- ./dockerfiles/custom-build-for-caddy.dockerfile
- ./staticonfig/caddy/Caddyfile

### Persistent Data and Configuration
`/srv`

How you configure the apps and their current states. This is separated from the Docker Compose (ie. "setup") as these become specific to how *you* use the services - not how they're installed/maintained.

## Port Reservations
Ports are controlled through variables to provide a central "fact check".

