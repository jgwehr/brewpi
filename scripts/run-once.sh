varMainDir=/opt/docker/this-repo

####################
# .env Management
####################
cp $varMainDir/.env.template $varMainDir/.env


####################
# Recurring Maintenance
####################
sh run-each-update.sh
