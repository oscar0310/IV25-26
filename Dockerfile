FROM ruby:3.4

WORKDIR /app

COPY . .

RUN bundle install

CMD ["bundle", "exec", "rake", "test"]