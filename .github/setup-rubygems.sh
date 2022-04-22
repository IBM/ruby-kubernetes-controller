#!/usr/bin/env bash

mkdir ~/.gem
echo -e "---\r\n:rubygems_api_key: $RUBYGEMS_API_KEY" > ~/.gem/credentials
chmod 0600 ~/.gem/credentials