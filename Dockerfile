#
# Wpscan Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

# Update & install packages for wpscan
RUN apt-get update && \
    apt-get install -y gcc git ruby ruby-dev libcurl4-openssl-dev make zlib1g-dev procps

#Clone repository
RUN git clone https://github.com/wpscanteam/wpscan.git

WORKDIR /wpscan

#Copy config file
RUN gem install bundler && bundle install --without test


CMD /wpscan/wpscan.rb --update -u $URL
