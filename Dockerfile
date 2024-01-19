FROM --platform=linux/x86_64 ruby:3.1-alpine

LABEL Name=achievemore-ruby Version=3.1

WORKDIR /app

RUN gem update bundler

RUN apk --update --upgrade --no-cache add \
    build-base \
    sqlite-dev \
    tzdata \
    shared-mime-info

RUN apk --update add less

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler
RUN gem update --system
RUN bundle install
COPY . /app

# Fix sqlite3_native.so: posix_fallocate64: symbol not found - source: https://gist.github.com/hopsoft/9a0bf00be2816cbe036fae5aa3d85b73
RUN gem uninstall sqlite3 --all
RUN CFLAGS=-DSQLITE_DEFAULT_PAGE_SIZE=16300 gem install sqlite3 --platform=ruby

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
