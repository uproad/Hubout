FROM ruby:2.5.1

RUN apt-get update
RUN apt-get install -y lsb-release

RUN wget https://repo.mysql.com//mysql-apt-config_0.8.10-1_all.deb
RUN echo "1\n3\n4" > /tmp/text.txt
RUN dpkg -i mysql-apt-config_0.8.10-1_all.deb < /tmp/text.txt

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
