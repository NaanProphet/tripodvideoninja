FROM ruby:2.6

SHELL ["/bin/bash", "-c"]

RUN gem install jekyll bundler && gem update --system

EXPOSE 4000
