FROM ruby:2.5-alpine

LABEL Name=achievemore-ruby Version=2.5

WORKDIR /app

RUN gem update bundler

RUN apk --update --upgrade --no-cache add \
    build-base \
    sqlite-dev \
    tzdata

RUN apk --update add less

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]