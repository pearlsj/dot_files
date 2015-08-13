#!/bin/bash

commands=( "mysqld_safe" "passenger start -e local_production" "RAILS_ENV=local_production rake market_data:use_latest" "sudo mongod" )

for command in "${commands[@]}"; do
  osascript\
  -e "tell application \"Terminal\" to activate"\
  -e "tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down"\
  -e "tell application \"Terminal\" to do script \"cd ~/likeassets/projects/appserver && $command\" in selected tab of the front window"
done
