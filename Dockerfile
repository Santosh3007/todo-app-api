FROM ruby:3.0.3-alpine3.14

RUN apk update && apk add bash build-base nodejs postgresql-dev tzdata

WORKDIR /app 

COPY Gemfile Gemfile.lock ./
RUN bundle install 

COPY . .

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]