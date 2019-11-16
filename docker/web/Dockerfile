FROM ruby:2.6.3
ENV LANG C.UTF-8
ENV APP_NAME /ec_cookie

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs
RUN wget https://github.com/yarnpkg/yarn/releases/download/v1.17.3/yarn_1.17.3_all.deb && dpkg -i yarn_1.17.3_all.deb
RUN gem install bundler

RUN mkdir $APP_NAME
WORKDIR $APP_NAME

COPY . $APP_NAME

RUN bundle install
RUN yarn install
