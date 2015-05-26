FROM varsy/centos6-utils

MAINTAINER Andrey Sizov, andrey.sizov@jetbrains.com

RUN yum install -y nrpe nagios-plugins-disk nagios-plugins-load nagios-plugins-procs

ADD run-services.sh /
RUN chmod +x /run-services.sh

CMD /run-services.sh

EXPOSE 5666

