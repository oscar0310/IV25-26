FROM ruby:3.4-slim

WORKDIR /app

COPY . .

RUN bundle install

CMD ["bundle", "exec", "rake", "test"]