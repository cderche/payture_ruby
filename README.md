# Payture for Ruby

Welcome to the Payture for Ruby gem! This gem allows you to integrate Payture into your Ruby application (Rails, etc.)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'payture_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install payture_ruby

## Usage

In your code you will need to require the gem:
```ruby
require 'payture'
```

## API

### Payture::Wallet

#### Init
```ruby
HOST = ENV['PAYTURE_HOST'] // i.e. sandbox.payture.com
MERCHANT_ADD = ENV['PAYTURE_ADD'] // VWMerchantExampleAdd

payload = {
  OrderId:      'ABC123',
  SessionType:  'Block',
  VWUserLgn:    @user.email,
  VWUserPsw:    @user.token,
  Amount:       100
}

wallet = Payture::Wallet.new(HOST)
result = wallet.init(MERCHANT_ADD, payload)
```

#### Pay
```ruby
HOST = ENV['PAYTURE_HOST'] // i.e. sandbox.payture.com
MERCHANT_PAY = ENV['PAYTURE_PAY'] // VWMerchantExamplePay

payload = {
  OrderId:      'DCB312',
  VWUserLgn:    @user.email,
  VWUserPsw:    @user.token,
  Amount:       100
  CardId:       @order.card_id
}

wallet = Payture::Wallet.new(HOST)
result = wallet.pay(MERCHANT_PAY, payload)
```

### Payture::User

#### Register
```ruby
HOST = ENV['PAYTURE_HOST'] // i.e. sandbox.payture.com
MERCHANT_ADD = ENV['PAYTURE_ADD'] // VWMerchantExampleAdd

payload = {
  VWUserLgn:    @user.email,
  VWUserPsw:    @user.token
}

wallet = Payture::User.new(HOST)
result = wallet.register(MERCHANT_ADD, payload)
```

#### Update
```ruby
HOST = ENV['PAYTURE_HOST'] // i.e. sandbox.payture.com
MERCHANT_ADD = ENV['PAYTURE_ADD'] // VWMerchantExampleAdd

payload = {
  VWUserLgn:    @user.email,
  VWUserPsw:    @user.token,
  Phone:        @user.phone
}

wallet = Payture::User.new(HOST)
result = wallet.update(MERCHANT_ADD, payload)
```

#### Check
```ruby
HOST = ENV['PAYTURE_HOST'] // i.e. sandbox.payture.com
MERCHANT_ADD = ENV['PAYTURE_ADD'] // VWMerchantExampleAdd

payload = {
  VWUserLgn:    @user.email,
  VWUserPsw:    @user.token
}

wallet = Payture::User.new(HOST)
result = wallet.check(MERCHANT_ADD, payload)
```

#### Delete
```ruby
HOST = ENV['PAYTURE_HOST'] // i.e. sandbox.payture.com
MERCHANT_ADD = ENV['PAYTURE_ADD'] // VWMerchantExampleAdd
PASSWORD = ENV['PAYTURE_PASSWORD']

payload = {
  VWUserLgn:    @user.email,
  password:     PASSWORD
}

wallet = Payture::User.new(HOST)
result = wallet.delete(MERCHANT_ADD, payload)
```

### Payture::Cards

#### GetList
```ruby
HOST = ENV['PAYTURE_HOST'] // i.e. sandbox.payture.com
MERCHANT_ADD = ENV['PAYTURE_ADD'] // VWMerchantExampleAdd

payload = {
  VWUserLgn:    @user.email,
  VWUserPsw:    @user.token
}

wallet = Payture::Cards.new(HOST)
result = wallet.list(MERCHANT_ADD, payload)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/payture_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
