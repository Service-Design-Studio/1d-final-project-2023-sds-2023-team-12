# Use the official lightweight Ruby image.
# https://hub.docker.com/_/ruby
FROM ruby:3.2-buster

RUN gem install rails -v 7.0.5


# Verify Rails installation
RUN rails --version

RUN (curl -sS https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | apt-key add -) && \
    echo "deb https://deb.nodesource.com/node_14.x buster main"      > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs lsb-release

RUN (curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -) && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Install production dependencies.
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN apt-get update && apt-get install -y libpq-dev && apt-get install -y python3-distutils
RUN gem install bundler && \
    bundle config set --local deployment 'true' && \
    bundle config set --local without 'development test' && \
    bundle install

# Copy local code to the container image.

COPY . /app

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
# Redirect Rails log to STDOUT for Cloud Run to capture
ENV RAILS_LOG_TO_STDOUT=true
ENV SECRET_KEY_BASE=vdl4jXpVoeWqhEa5e7x1ESjv5/8c6koVukg9F1LwAqGp3KZMZ0toc/IybzNq3x1X4MZ+kUJ2sWJ8jk6pvhLiLtsSh66cAtnEdHNQf/kxy8fhFk/eqzETT+YP2cfg0nB7iJUDhDkCfJguTGfdEl+SS6Dypgx9PEtYS4tNubObOOX/3VJGP//jmaj/7EA4tk9V+fAOKjz3ZLDWTi9uvm4B4OU60E35u3C/yDYsq3eo9tGmrbcD9eZdqDNhr6fydwFdSMznFQg5b5SrzZHGaj4/FLEbI05NVYQjHtPtISRCPP2meHCc9JCH/Sd6DjIfhJVNRQDgOAnBL+YtR2eKA2To8mqt/sYqu8wV9Fgl8tT4lez85oYO5KM/2cL5FeZoBbyDqFfnoI4XQKq+X7wWJmVIxKBurUF8k38cdDGE--ds1hC/SpcSLUhrCj--jbJhPUalCWw9RauB4hs6Fw==

# pre-compile Rails assets with master key
RUN bundle exec rake assets:precompile


ENV RAILS_ENV=production

RUN bundle exec rake db:create
RUN bundle exec rake db:migrate
RUN bundle exec rake db:seed

EXPOSE 8080
RUN chmod u+x bin/rails
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8080"]