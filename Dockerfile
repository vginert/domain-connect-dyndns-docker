FROM python:3-alpine3.16

RUN apk add --no-cache gcc musl-dev python3-dev openssl-dev libffi-dev cargo
RUN pip install domain-connect-dyndns==0.0.9

ENV CRON_TIME="* * * * *"
ENV SETTINGS_PATH="/data/settings.txt"
ENV PROTOCOLS="ipv4"
ENV IGNORE_PREVIOUES_IP=false

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
