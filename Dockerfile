FROM varsy/centos6-utils

MAINTAINER Andrey Sizov, andrey.sizov@jetbrains.com

RUN yum install -y nrpe nagios-plugins-disk nagios-plugins-load nagios-plugins-procs
RUN echo "command[check_disks]=/usr/lib64/nagios/plugins/check_disk -w 10% -c 5%" >> /etc/nrpe.d/check_disks.cfg

ADD run-services.sh /
RUN chmod +x /run-services.sh

CMD /run-services.sh

EXPOSE 5666

