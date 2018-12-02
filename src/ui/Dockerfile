FROM ruby:2.3-alpine3.7

WORKDIR /app
COPY . /app

RUN apk add --update --no-cache build-base==0.5-r0 && bundle install

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
