FROM --platform=linux/x86_64 ruby:3.1-alpine

LABEL Name=achievemore-ruby Version=3.1

WORKDIR /app

RUN gem install bundler

RUN apk --update --upgrade --no-cache add \
    build-base \
    sqlite-dev \
    tzdata \
    shared-mime-info

RUN apk --update add less

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
