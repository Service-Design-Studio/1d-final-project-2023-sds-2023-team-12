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
ENV SECRET_KEY_BASE=ZBA4uUaUKepIAVWt+ru9thbwJtCAC9J93ZZH5Hp/28U4+FtikmqZSekoKOe5lQp46b5v+1Wtk9LbyfcnMngoMZ1fQPRq5ZfTiFVE9daUgBAa/vCaNNI3o/+JGcvTVAratsYCcjvZ68T8XVFDRFvnWBRRthDNzvM9qblmeUURYVqxo688Po06kS/AVoV83T39n1tIGghdRhWS9IjIUB9cWra6ywBiSZzrFOkPZye7L9NAKNQvfO+bBLGV5UrayDaD3Oix1R7UVJ++DTI1q2hRbW55WmCdhaH1WWKUMW8IflT7ChoYHgHhY2KJHv9FiAT65dr0aLsRF0z+04uWtiJeWoHjH3deZJi0IYXQRyqrqMjXIfbnO56HBE070RdtKbCqQ4KI5pSfO0ighxrv241Q4pW9qM+/zHikK/e6HSZsXY0d9M5xRSlDqMssMhl5SGYXh4kvQGLBt7ZaGGeQzt2TYPlrZXpRvLMSN7yysN7fkIQEAZv/D1EonQIGr2lI--sE3J9t8RNvT6EDtp--vFsaVznU4E8vf83WgXZ6GQ==

# pre-compile Rails assets with master key
RUN bundle exec rake assets:precompile


ENV RAILS_ENV=production

# RUN bundle exec rake db:create
# RUN bundle exec rake db:migrate
# RUN bundle exec rake db:seed

EXPOSE 8080
RUN chmod u+x bin/rails
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8080"]