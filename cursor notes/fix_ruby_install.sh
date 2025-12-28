#!/bin/bash

# Fix Ruby installation with OpenSSL 1.1 on macOS
# This script ensures Ruby compiles against OpenSSL 1.1 instead of OpenSSL 3

echo "Removing failed Ruby installation..."
rvm remove ruby-3.2.8 2>/dev/null || true

echo "Setting up OpenSSL 1.1 environment..."
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export CFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"

echo "Installing Ruby 3.2.8 with OpenSSL 1.1..."
rvm install 3.2.8 --with-openssl-dir=/opt/homebrew/opt/openssl@1.1

echo "Setting Ruby 3.2.8 as default..."
rvm use 3.2.8 --default

echo "Verifying installation..."
ruby -v
which ruby

echo "Done! Ruby should now be installed correctly."

