FROM ruby:2.5.1

RUN apt-get update && \
    apt-get install -y mysql-client nodejs --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /hubout

WORKDIR /hubout

ADD Gemfile /hubout/Gemfile
ADD Gemfile.lock /hubout/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /hubout
