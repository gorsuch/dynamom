# Dynamom

[![Build Status](https://secure.travis-ci.org/gorsuch/dynamom.png)](http://travis-ci.org/gorsuch/dynamom)

A DynamoDB management API.

Current supports basic provisioning, will plan to support IAM key generation as well.

## Installation

Add this line to your application's Gemfile:

    gem 'dynamom'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dynamom

## Usage

Standard `Rack` app:

```bash
$ bundle exec rackup -I lib
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
