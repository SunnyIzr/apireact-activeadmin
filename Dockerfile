# syntax=docker/dockerfile:1
FROM ruby:3.0.0

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
      apt-get install -y nodejs build-essential

RUN npm install -g npm@8.1.3
RUN npm install -g @vue/cli@4.5.15

RUN npm install

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /apireact-activeadmin

COPY Gemfile /apireact-activeadmin/Gemfile
COPY Gemfile.lock /apireact-activeadmin/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]