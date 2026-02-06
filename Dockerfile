FROM ruby:alpine

RUN apk add --no-cache build-base

RUN adduser -D user_sin_permisos

ENV GEM_HOME="/gems"
ENV BUNDLE_PATH="$GEM_HOME"
ENV PATH="$GEM_HOME/bin:$PATH"

RUN mkdir -p "$GEM_HOME" && chown -R user_sin_permisos:user_sin_permisos "$GEM_HOME"

WORKDIR /app

USER user_sin_permisos

COPY --chown=user_sin_permisos:user_sin_permisos Gemfile Gemfile.lock ./

RUN bundle install