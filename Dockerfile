FROM ruby:alpine

RUN apk add --no-cache build-base

RUN adduser -D user_sin_permisos

USER user_sin_permisos

COPY --chown=user_sin_permisos:user_sin_permisos Gemfile Gemfile.lock ./

RUN bundle install

ENTRYPOINT ["bundle", "exec", "rake", "test"]