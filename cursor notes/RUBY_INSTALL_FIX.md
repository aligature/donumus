# Fix for Ruby 3.2.x Installation on macOS with OpenSSL Issues

## Problem
Ruby 3.2.x compilation fails with OpenSSL 3.6.0 due to header incompatibilities. Even when configured to use OpenSSL 1.1, the compiler may still find OpenSSL 3 headers in system paths.

## Solution 1: Use the Automated Fix Script (Easiest)

Run the provided script that sets all necessary environment variables:

```bash
./fix_ruby_install.sh
```

## Solution 2: Manual Installation with OpenSSL 1.1 (Recommended)

The issue is that even with `--with-openssl-dir`, the compiler finds OpenSSL 3 in system paths. Force OpenSSL 1.1:

```bash
# Remove the failed installation
rvm remove ruby-3.2.8

# Set environment variables to force OpenSSL 1.1
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export CFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"

# Install with explicit OpenSSL 1.1
rvm install 3.2.8 --with-openssl-dir=/opt/homebrew/opt/openssl@1.1
```

## Solution 3: Use Ruby 3.3.x (Better OpenSSL 3 Support)

Ruby 3.3.x has native OpenSSL 3 support and may work better:

```bash
# Remove failed installation
rvm remove ruby-3.2.8

# Install Ruby 3.3.x (works with OpenSSL 3)
rvm install 3.3.5 --with-openssl-dir=/opt/homebrew/opt/openssl@3
rvm use 3.3.5 --default
```

Then update your `.ruby-version` to `3.3.5` and Gemfile to `ruby '~> 3.3.0'`.

## Solution 4: Patch Ruby Source (Advanced)

If you must use Ruby 3.2.8 with OpenSSL 3, you can patch the source:

```bash
rvm remove ruby-3.2.8
rvm install 3.2.8 --patch <(curl -sSL https://raw.githubusercontent.com/ruby/ruby/master/ext/openssl/ossl_hmac.c)
```

## Recommended Approach

**Option A: Use OpenSSL 1.1 with Ruby 3.2.8** (if you need exactly 3.2.x)
- Run `./fix_ruby_install.sh` or follow Solution 2

**Option B: Use Ruby 3.3.5 with OpenSSL 3** (recommended for new projects)
- Follow Solution 3
- Ruby 3.3.x is fully compatible with Rails 7.1
- Better long-term support

## Verification

After installation, verify it works:

```bash
ruby -v
ruby -ropenssl -e "puts OpenSSL::OPENSSL_VERSION"
```

You should see OpenSSL version information without errors.

