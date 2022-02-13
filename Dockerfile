FROM ruby:3.1

# Install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential libpq-dev imagemagick git-all nano graphviz \
    libnss3 zlib1g-dev liblzma-dev wget xvfb unzip

RUN echo 'alias rspec="bundle exec rspec"' >> ~/.bashrc && \
    echo 'alias rails="bundle exec rails"' >> ~/.bashrc

# env var with workdir path
ENV INSTALL_PATH /das-web-api

ENV TEST_DATABASE_HOST "postgres"

# create workdir
RUN mkdir -p $INSTALL_PATH

# define initial location of the container
WORKDIR $INSTALL_PATH

# copy Gemfile to container
COPY Gemfile ./

# gems path
ENV BUNDLE_PATH /gems

# copy application dir to container
COPY . .
