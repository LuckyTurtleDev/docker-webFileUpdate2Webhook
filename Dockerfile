
FROM debian:stable-slim

LABEL git=https://github.com/Lukas1818/

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install -y curl sed

RUN useradd -m -u 1000 user

COPY executeList.sh /home/user/executeList.sh
ADD https://raw.githubusercontent.com/Lukas1818/webFileUpdate2Webhook/master/webFileUpdate2Webhook.sh /home/user/webFileUpdate2Webhook.sh
RUN chmod u+x /home/user/webFileUpdate2Webhook.sh /home/user/executeList.sh \
 && chown 1000:1000 /home/user/webFileUpdate2Webhook.sh /home/user/executeList.sh

USER user
WORKDIR /home/user

ENV INTERVAL=3600

CMD ["/home/user/executeList.sh"]
