# = Overview:
# A simple library for sending sms messages using the Kapow sms gateway.
# ---
# = License:
# Author:: Kieran Johnson
# Copyright:: July, 2008
# License:: Ruby License
# ---
# = Usage:
#   require 'rubygems'
#   require 'kapow'
#
#   msg = Kapow::Message.new('username', 'password')
#   msg.deliver('mobile_no', 'sms')

require 'uri'
require 'net/http'
require 'kapow/version'
require 'kapow/response'
require 'kapow/sms'
require 'kapow/credit'

module Kapow

end
