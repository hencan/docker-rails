# Selected Image
FROM ubuntu:20.04
# Dependencies
RUN apt-get -y update
RUN apt-get -y install build-essential
RUN apt-get -y install libssl-dev
RUN apt-get -y install libreadline-dev
RUN apt-get -y install zlib1g-dev
RUN apt-get -y install net-tools
RUN apt-get -y install iputils-ping
RUN apt-get -y install curl
RUN apt-get -y install git
RUN apt-get -y install vim
# ASDF
# RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
# RUN echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
# RUN echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
# RUN bash .asdf/
# RUN asdf --version

# Ruby
# RUN asdf plugin list all
# RUN asdf plugin add ruby
# RUN asdf install ruby 2.7.2
# RUN asdf install ruby 2.6.0
# RUN asdf global ruby 2.7.2
# Nodejs
# RUN asdf plugin add nodejs
# RUN bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
# RUN bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-previous-release-team-keyring'
# RUN asdf install nodejs 14.15.4
# RUN asdf global nodejs 14.15.4
# # SQLite
# RUN asdf plugin add sqlite
# RUN asdf install sqlite 3.34.1
# RUN asdf global sqlite 3.34.1
# RUN apt-get install libsqlite3-dev
# Rails
# RUN gem install rails
