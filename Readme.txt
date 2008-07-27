== Basic Usage

To use this library you first need to sign up for an account at www.kapow.com.

The library wraps the HTTP POST service provided as this has the advantages of
speed and an immediate response message.

Responses provided by Kapow are:

OK = message has been accepted for delivery (this is followed by the number of credits remaining, or the word 'CREDIT').
USERPASS = invalid username or password.
NOCREDIT = account has no credits or credit limit has been reached.
ERROR = any other error has occurred.


require 'rubygems'
require 'kapow'

# Create a new message
msg = Kapow::Message.new('username', 'password', 'mobile_no', 'message')
msg.deliver

# View the amount of available credit
Kapow::Credit