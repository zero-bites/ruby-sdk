# Trolley Ruby SDK (Previously Payment Rails[^1])

[![Latest Stable Version](https://poser.pugx.org/paymentrails/ruby-sdk/v/stable.png)](https://packagist.org/packages/paymentrails/ruby-sdk)

The Trolley Ruby SDK provides integration access to the Trolley API.

[^1]: [Payment Rails is now Trolley](https://www.trolley.com/payment-rails-is-now-trolley-series-a). We're in the process of updating our SDKs to support the new domain. In this transition phase, you might still see "PaymentRails" at some places.

## Requirements

Ruby version >= 2.4 is required.
Bundler is required.

## Installation & Usage (RubyGem)

### Install the Gem

```bash
gem install paymentrails
```

## Installation & Usage (Git)

### Clone the SDK

```bash
git clone https://github.com/PaymentRails/ruby-sdk.git
```

### Build & Install the gem

```bash
cd ruby-sdk
bundler install
gem build paymentrails.gemspec
gem install paymentrails-[version].gem
```

### Running Tests

```
// set keys as environment variables
export SANDBOX_ACCESS_KEY="your_access_key"
export SANDBOX_SECRET_KEY="your_secret_key"

// run a single test file, for example:
bundle exec ruby spec/integration/RecipientTest.rb
```

## Getting Started

```Ruby

require 'paymentrails'

client = PaymentRails.client('YOUR-API-KEY', 'YOUR-SECRET-KEY')

recipient = client.recipient.find('R-1234567abcdefg')
print recipient.id
```

#### Need a proxy?

```Ruby
client = PaymentRails.client('YOUR-API-KEY', 'YOUR-SECRET-KEY', 'production', proxy_uri: 'peter_the_proxy.com')
```

## Documentation for API Endpoints

All URIs are available at http://docs.trolley.com/
