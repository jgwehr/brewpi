varMainDir=/opt/docker/this-repo

####################
# .env Management
####################
cp $varMainDir/.env.template $varMainDir/.env


####################
# infra-docker (required)
####################
sh $varMainDir/services/infra-docker/run-once.sh


####################
# Recurring Maintenance
####################
sh run-each-update.sh
