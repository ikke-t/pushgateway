FROM        registry.access.redhat.com/rhel
LABEL maintainer "The Prometheus Authors <prometheus-developers@googlegroups.com>"

COPY pushgateway /bin/pushgateway

EXPOSE     9091

ENV APP_ROOT=/pushgateway

RUN mkdir -p ${APP_ROOT}
RUN chgrp -R 0 ${APP_ROOT} && chmod -R g=u ${APP_ROOT} /etc/passwd
USER 10001
WORKDIR ${APP_ROOT}
ENTRYPOINT [ "/bin/pushgateway" ]
