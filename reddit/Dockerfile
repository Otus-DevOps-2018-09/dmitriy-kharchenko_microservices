FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y mongodb-server ruby-full ruby-dev build-essential && \
    gem install bundler

WORKDIR /reddit
# COPY mongod.conf /etc/mongod.conf
# COPY db_config /reddit/db_config
# COPY start.sh /start.sh
COPY ./ /reddit

RUN bundle install && mv ./mongod.conf /etc/mongod.conf && chmod 0777 /reddit/start.sh

CMD ["/reddit/start.sh"]
