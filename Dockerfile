FROM ruby:2-buster
MAINTAINER chocorean
EXPOSE 3000

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -y
RUN apt-get install -y tmux nodejs vim yarn
RUN git clone https://github.com/Chocorean/chocorp_web.git /opt/chocorp

WORKDIR /opt/chocorp
RUN sed -i s/ruby\ \'2.7.0/ruby\ \'2.7.3/ Gemfile
COPY config/master.key config/
COPY private /opt/chocorp/private
COPY bin /opt/chocorp/bin

RUN bundle install
RUN RAILS_ENV=production rake db:create
RUN RAILS_ENV=production rake db:migrate
RUN RAILS_ENV=production rails assets:precompile

VOLUME /opt/chocorp
CMD rails s -e production -b 'ssl://0.0.0.0:3000?key=private/cert/www_chocorp_net.key&cert=private/cert/www_chocorp_net.full.crt'

