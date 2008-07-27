Kapow - Ruby library for Kapow SMS gateway service

  by Kieran Johnson
  http://github.com/kieranj/kapow

== INSTALLATION:

  $ gem sources -a http://gems.github.com/ (you only need to do this once)
  $ gem install kieranj-kapow

== USAGE:

To use this library you first need to sign up for an account at www.kapow.com.

The library wraps the HTTP POST service provided as this has the advantages of
speed and an immediate response message.

Example

require 'rubygems'
require 'kieranj-kapow'

# Create a new message
msg = Kapow::Message.new('username', 'password')
msg.deliver('mobile_no', 'sms')

Responses provided by the Kapow SMS Gateway are:

OK = message has been accepted for delivery.
USERPASS = invalid username or password.
NOCREDIT = account has no credits or credit limit has been reached.
ERROR = any other error has occurred.

The amount of remaining credit is included with the 'OK' response from the gateway. This is available as

Kapow::Credit
# => 325