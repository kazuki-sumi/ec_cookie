FROM ruby:2.6.3
ENV LANG C.UTF-8
ENV APP_NAME /ec_cookie

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    yarn

RUN gem install bundler

RUN mkdir $APP_NAME
WORKDIR $APP_NAME

COPY . $APP_NAME

RUN bundle install
