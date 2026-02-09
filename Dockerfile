FROM ruby:alpine

RUN apk add --no-cache build-base

RUN adduser -D user_sin_permisos

COPY Gemfile Gemfile.lock ./

RUN bundle install

ENTRYPOINT ["bundle", "exec", "rake", "test"]