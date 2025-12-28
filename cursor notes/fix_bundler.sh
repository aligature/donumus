#!/bin/bash

# Fix Bundler and OpenSSL certificate issues for Ruby 3.3.5

echo "Fixing OpenSSL certificates..."
# Set SSL certificate path for Homebrew OpenSSL
export SSL_CERT_FILE=$(brew --prefix)/etc/openssl@3/cert.pem
if [ ! -f "$SSL_CERT_FILE" ]; then
    # Try OpenSSL 1.1 path
    export SSL_CERT_FILE=$(brew --prefix)/etc/openssl@1.1/cert.pem
fi

# If still not found, use system certificates
if [ ! -f "$SSL_CERT_FILE" ]; then
    export SSL_CERT_FILE=/etc/ssl/cert.pem
fi

echo "SSL_CERT_FILE set to: $SSL_CERT_FILE"

echo "Installing modern Bundler..."
gem install bundler --no-document

echo "Removing old Gemfile.lock..."
rm -f Gemfile.lock

echo "Installing gems with new Bundler..."
bundle install

echo "Done!"

