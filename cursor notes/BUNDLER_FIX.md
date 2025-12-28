# Fix for Bundler and OpenSSL Certificate Issues

## Problem
1. **Bundler 1.17.1 is incompatible** with Ruby 3.3.5 (uses deprecated `untaint` method)
2. **OpenSSL certificate error** preventing gem operations

## Quick Fix

Run the provided script:
```bash
./fix_bundler.sh
```

## Manual Fix

### Step 1: Fix OpenSSL Certificates

```bash
# Set SSL certificate path
export SSL_CERT_FILE=$(brew --prefix)/etc/openssl@3/cert.pem

# If that doesn't exist, try:
export SSL_CERT_FILE=$(brew --prefix)/etc/openssl@1.1/cert.pem

# Or use system certificates:
export SSL_CERT_FILE=/etc/ssl/cert.pem
```

### Step 2: Install Modern Bundler

```bash
gem install bundler --no-document
```

### Step 3: Remove Old Lockfile and Reinstall

```bash
rm Gemfile.lock
bundle install
```

## Alternative: Install Certificates via Homebrew

If certificates are missing:

```bash
# Install ca-certificates
brew install ca-certificates

# Set the certificate path
export SSL_CERT_FILE=$(brew --prefix)/etc/ca-certificates/cert.pem
```

## Make Certificate Fix Permanent

Add to your `~/.zshrc` or `~/.bash_profile`:

```bash
export SSL_CERT_FILE=$(brew --prefix)/etc/openssl@3/cert.pem
```

Then reload:
```bash
source ~/.zshrc
```

## Verify

After fixing, verify it works:

```bash
ruby -ropenssl -e "puts OpenSSL::OPENSSL_VERSION"
gem list bundler
bundle --version
```

