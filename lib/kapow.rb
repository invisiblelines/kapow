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
#   require 'kieranj-kapow'
# 
#   msg = Kapow::Message.new('username', 'password')
#   msg.deliver('mobile_no', 'sms')

module Kapow

  %w(version response message credit).each do |lib|
    require File.join(File.dirname(__FILE__), 'kapow', lib)
  end

end