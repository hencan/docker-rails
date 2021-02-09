FROM ubuntu:20.04

RUN apt-get update -qq && \
    apt-get upgrade -qq -y && \
    apt-get install -qq -y \
            build-essential \
            libssl-dev \
            libreadline-dev \
            zlib1g-dev \
            net-tools \
            iputils-ping \
            autoconf \
            # libncurses5-dev \
            # libssh-dev \
            libsqlite3-dev \
            vim \
            git \
            curl \
            unzip \
            inotify-tools && \
    apt-get clean -qq -y && \
    apt-get autoclean -qq -y && \
    apt-get autoremove -qq -y && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/*

ENV LANG C.UTF-8

RUN useradd -ms $(which bash) asdf

ENV PATH /home/asdf/.asdf/bin:/home/asdf/.asdf/shims:$PATH

USER asdf

# asdf

RUN /bin/bash -c "git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0 && \
                  echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc \
                  echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc \
                  asdf update && \
                  asdf plugin-add sqlite && asdf plugin-add ruby && asdf plugin-add nodejs &&\
                  bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring' &&\
                  bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-previous-release-team-keyring' &&\
                  asdf install nodejs 14.15.4 && asdf global nodejs 14.15.4 && \
                  asdf install nodejs 12.18.3 %% \
                  asdf install ruby 2.7.2 && asdf global ruby 2.7.2 && \
                  asdf install ruby 2.6.0 && \
                  asdf install sqlite 3.34.1 && asdf global sqlite 3.34.1 && \
                  mkdir test && cd test/ && asdf local nodejs 12.18.3 && asdf local ruby 2.6.0 && \
                  gem install rails && \
                  rm -rf  /tmp/*"
