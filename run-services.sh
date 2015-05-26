#!/bin/sh

log() {
    echo "`date +%Y-%m-%d-%H%M%S` - "$1 >> /var/log/container.log
}

touch /var/log/container.log
tail -F /var/log/container.log &

if [[ -f /conf/nrpe.cfg ]]; then
    cp -pf /conf/nrpe.cfg /etc/nagios/
    log "Applying nrpe.cfg configuration"
fi

if [[ -f /conf/nrpe.additional.cfg ]]; then
    cp -pf /conf/nrpe.additional.cfg /etc/nrpe.d/
    log "Applying nrpe.additional.cfg configuration"
fi

if [[ ${ALLOWEDHOSTS} ]]; then
    sed -i "s|allowed_hosts=.*|allowed_hosts=${ALLOWEDHOSTS}|" /etc/nagios/nrpe.cfg
    log "Setting allowed_hosts to '${ALLOWEDHOSTS}'"
fi

trap "/sbin/service nrpe stop; killall tail; exit 0" SIGINT SIGTERM SIGHUP

/sbin/service nrpe start

wait

