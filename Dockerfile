FROM ruby:alpine

COPY Gemfile Gemfile.lock ./
RUN bundle install