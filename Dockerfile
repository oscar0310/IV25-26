FROM ruby:alpine

RUN apk add --no-cache build-base

COPY Gemfile Gemfile.lock ./

RUN bundle install

ENTRYPOINT ["bundle", "exec", "rake", "test"]