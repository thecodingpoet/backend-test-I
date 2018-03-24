# require 'rubygems'
require 'twitter'
require 'dotenv'
require_relative 'sheets'
Dotenv.load

class TwitterBot
    def get_tweets(tags)
        tags = valid_tags(tags)
        sheets ||= GoogleSheets.new
        client.filter(track: tags.join(",")) do |object|
            return false unless object.is_a?(Twitter::Tweet)
            sheets.add(object.user.name, object.user.followers_count)
            puts "Profile Name: #{object.user.name}"
            puts "UserName: #{object.user.screen_name}"
            puts "Followers: #{object.user.followers_count}"
            puts "Tweet: #{object.text}"
            puts "Tags: #{get_hashtags(object.hashtags)}"
            puts "----------------------------------------------------------------------------------"
        end
    end

    private

    def valid_tags(tags)
        tags.each { |tag| tag.prepend("#") if tag[0] != "#" }
    end

    def get_hashtags(tags)
        tags.map { |tag| tag.text }
    end

    def client
        @client ||= Twitter::Streaming::Client.new do |config|
            config.consumer_key        = ENV['consumer_key']
            config.consumer_secret     = ENV['consumer_secret']
            config.access_token        = ENV['access_token']
            config.access_token_secret = ENV['access_token_secret']
        end
    end
end

puts "[+] Enter each hashtag seperated by a comma or space:"
tags = gets.chomp.split(/[\s,]+/)
puts "[-] Filter streams based on the following hashtags: #{tags}"
puts "----------------------------------------------------------------------------------"
puts TwitterBot.new.get_tweets(tags)

