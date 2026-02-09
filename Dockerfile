FROM ruby:alpine

RUN apk add --no-cache build-base

COPY Gemfile Gemfile.lock ./

RUN bundle install