FROM ruby:2.4.9
RUN apt-get update -qq && apt-get install -y nodejs 
RUN apt-get install -y imagemagick
RUN apt-get install -y sqlite3
WORKDIR /satcm
COPY Gemfile* ./
RUN bundle install
EXPOSE 3000
CMD [ "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
