FROM php:7.4-cli

MAINTAINER Carlos Faria <carlos@blavetstudio.com>

SHELL ["/bin/bash", "--login", "-c"]

## Install required system packages
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    curl \
    git \
    python3-pip \
    openssh-client \
    rsync

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Install Node version 12.16.3
RUN nvm install v12.16.3

## Install Yarn globally
RUN npm install -g yarn

## Install ansible
RUN pip install 'ansible==2.8.4'
RUN pip install passlib

## Copy composer from composer:2 image
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# # Show versions
# RUN php -v \
#   && node -v \
#   && npm -v \
#   && yarn -v \
#   && ansible --version \
#   && composer --version \
#   && php -m


CMD ["bash"]