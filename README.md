# Spanx::Client

This gem connects to the API of spanx and allows for:

  * Listing of blocked IPs
  * Unblocking of a specific IP
  * Unblocking all ips (TODO)
  * Disabling Spanx (TODO)
  * Enabling Spanx (TODO)
  * Blocking a specific IP (TODO)

## Installation

Add this line to your application's Gemfile:

    gem 'spanx-api-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spanx-api-client

## Usage

### Configuration

To configure where the spanx api server lives:

```ruby
Spanx::Client.configure do |c|
  c.url = "http://some-server-in-outer-space.com"
end
```

### Listing all blocked ips

```ruby
Spanx::Client.blocked_ips
# => ["127.0.0.1", "192.168.1.1"]
```

### Unblocking a specific IP

```ruby
Spanx::Client.unblock("192.168.1.1")
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/spanx-api-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
