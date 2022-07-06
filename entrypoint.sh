#!/bin/sh

# create cron job
echo -n "$CRON_TIME /usr/bin/flock -n /tmp/ipupdate.lck /usr/local/bin/domain-connect-dyndns update --all" >> /tmp/crontab.txt
echo -n " --config $SETTINGS_PATH" >> /tmp/crontab.txt
echo -n " --protocols $PROTOCOLS" >> /tmp/crontab.txt
if [ $IGNORE_PREVIOUES_IP == true ]
then
   echo -n " --ignore-previous-ip" >> /tmp/crontab.txt
fi
/usr/bin/crontab /tmp/crontab.txt
rm /tmp/crontab.txt

# start cron
/usr/sbin/crond -f -l 8