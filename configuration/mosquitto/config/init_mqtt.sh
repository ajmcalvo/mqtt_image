#!/bin/sh
set -e

# create mosquitto initial users
if [ ! -f /mosquitto/config/.init ]; then
    chmod 0700 /mosquitto/config/passwd
    chmod 0700 /mosquitto/config/acls
    # create mosquitto users
    mosquitto_passwd -b /mosquitto/config/passwd chirpstack $MQTT_CS_PASSWORD
    mosquitto_passwd -b /mosquitto/config/passwd chirpstack_gb $MQTT_CGB_PASSWORD
    touch /mosquitto/config/.init
fi