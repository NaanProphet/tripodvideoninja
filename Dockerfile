FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get upgrade -y

RUN apt-get install ruby-full build-essential zlib1g-dev -y

RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc && \
    echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc && \
    echo 'export PATH="$HOME/gems/bin:\$PATH"' >> ~/.bashrc && \
    source ~/.bashrc

RUN gem install jekyll bundler && gem update --system

RUN bundle config --global silence_root_warning 1

EXPOSE 4000
