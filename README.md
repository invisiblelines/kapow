# Kapow

Ruby library for Kapow SMS gateway service

## Installation:

Include the gem in your Gemfile

```ruby
  gem 'kapow'
```

## Usage:

To use this library you first need to sign up for an account at www.kapow.com.

The library wraps the HTTP POST service provided as this has the advantages of
speed and an immediate response message.

```ruby
# Create a new sms
msg = Kapow::SMS.new('username', 'password')
msg.deliver('mobile_no', 'sms')
```

All options supported by Kapow can be passed into the deliver method as a hash

```ruby
# Send sms as a flash
msg.deliver('mobile_no', 'sms', :flash => true)

# Send sms with from_id (if enabled in account)
msg.deliver('mobile_no', 'sms', :from_id => 'from_id')

# Send sms up to 1377 characters long
msg.deliver('mobile_no', 'sms', :long_sms => true)
```

Responses provided by the Kapow SMS Gateway are:

| Name     | Description
---------- | -----------
| OK       | Message has been accepted for delivery.
| USERPASS | Invalid username or password. 
| NOCREDIT | Account has no credits or credit limit has been reached.
| ERROR    | Any other error has occurred.

The amount of remaining credit is included with the 'OK' response from the gateway. This is available as:

```ruby
Kapow::Credit #=> 325
```
