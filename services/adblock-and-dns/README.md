
####################
# .env Configuration
####################



### Orbital Sync
Because I have only one "extra" pi-hole, and I host the secondary on this server, I will re-use its variables instead of creating new ones.
If you have 3+ Pi-holes or a different docker setup, please review [Orbital Sync](https://github.com/mattwebbio/orbital-sync) readme and adjust your .env and compose files as needed

1. Your primary Pihole (ie some other server) should be configured to `ORBITAL_PRIMARY_HOST_BASE_URL`,  `ORBITAL_PRIMARY_HOST_PATH`, `ORBITAL_PRIMARY_HOST_PASSWORD`
1. This server is your "secondary" server and so most of the variables are from the pihole configuration. However, I left path just in case: `ORBITAL_SECONDARY_HOST_1_PATH`
1. Configure the frequency of the sync in minutes `ORBITAL_SYNC_INTERVAL`
1. For most people who are not using DHCP or other advanced pihole features, the most critical feature is to update the block list. Set `ORBITAL_UPDATE_GRAVITY` to true

There are notifications as well. However, these currently only support SMTP or honeybadger which I don't use.