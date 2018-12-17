FROM ruby:2.3-alpine3.7

WORKDIR /app
COPY . /app

RUN apk add --update --no-cache build-base==0.5-r0 && bundle install

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
