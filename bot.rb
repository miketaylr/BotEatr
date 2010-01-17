#!/usr/bin/ruby -w
#
# BotEatr: One Bot to Rule Them All
# January 15, 2010
# Copyright Mike Taylor
# MIT and all that

# Usage: 
#   Botty = BotEatr.new("UserName", "Password")
#   Botty.baitBots

class BotEatr
  attr_accessor :username, :password
  
  #blah blah blah boring
  def initialize(username, password)
    @username = username
    @password = password
  end
  
  def sendTweet(tweet)
    unless tweet.empty?
      `curl -u #{@username}:#{@password} -d "status=#{tweet}" http://twitter.com/statuses/update.json`
    end
  end
  
  def baitBots #if you build it, they will come
    #replace tweets.dat with whatever, to build your giant array of spammy tweets
    tweets = File.read("tweets.dat").split(',')
    tweets.each do |tweet|
      sendTweet(tweet)
      # (60secs X 60 mins) / 24secs = 150 API updates per hour (which is the limit)
      sleep(24) 
    end
  end
  
  def destroyBots
    #um, haven't figured this part out yet
  end
end