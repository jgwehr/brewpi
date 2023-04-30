
Includes: 


# Technology

| Infrastructure | Media | Other |
| :-: | :-: |  :-:  |


### Notes
Watchtower is intentionally avoided based off advice from the Selfhosted.show podcast. The idea is to have full control over the versions of containers (rather than automated updates) to improve reliability.

# Setup and Operation

## Starting services


# Project Structure
Work in Progress. Recommendations via *[multiple docker files](https://nickjanetakis.com/blog/docker-tip-87-run-multiple-docker-compose-files-with-the-f-flag)*, [Where to Put Docker Compose](https://nickjanetakis.com/blog/docker-tip-76-where-to-put-docker-compose-projects-on-a-server) *[TRaSH Guides](https://trash-guides.info/Hardlinks/How-to-setup-for/Docker/)*

## File System

```
├── /opt
│  └── docker
│     └── brewpi (this repo)
|        ├── dockerfiles (for custom builds)
│        |  └── builder-*.sh (for building files to upload)
│        |  └── *.dockerfile (for adhoc builds)
|        ├── staticconfig (service-specific configuration)
│        |  └── * (for each service)
│        |     └── *
│        ├── .env
│        └── docker-compose.yml
├── /srv
│  ├── docker (for container's configurations)
│  ├── cache
│  └── logs
└── /data
   ├── db
   └── staticfiles
```

### These may be created with the following cmds
`cd scripts`
`chmod +x start.sh`  
`./start.sh`

### Recursively own the /data directory
sudo chown -R $USER:$USER /data
sudo chmod -R a=,a+rX,u+w,g+w /data


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

