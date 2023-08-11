FROM ruby:3.1-alpine

LABEL Name=achievemore-ruby Version=2.6

WORKDIR /app

RUN gem update bundler

RUN apk --update --upgrade --no-cache add \
    build-base \
    sqlite-dev \
    tzdata

RUN apk --update add less

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN apk update && apk add shared-mime-info
RUN bundle install
COPY . /app

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
