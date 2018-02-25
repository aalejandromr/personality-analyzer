class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		require 'net/http'
		#To Add Twitter's User information
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "51ECpPKIfeUbkzw4nX7muME9I"
		  config.consumer_secret     = "pqTcPcnYnslXIEfYWqcbQzNexSWDXxa0qxEgt60pBRK6WLXmi1"
		  config.access_token        = "730590069178785793-g8qDJidKvJO1KnrZLOdqDREkw9ihDKl"
		  config.access_token_secret = "GSo5nACbN55a0wnvcaCMoMx4SsWqY8lthk0XsJTWff8uQ"
		end
			
		tweets = client.user_timeline(current_user.username, count: 40)
		string = ""
		tweets.each do |tweet|
		  string = "#{string} #{tweet.full_text}"
		end

		puts string

		#http.use_ssl = (uri.scheme == "https")
		require 'net/http'
		require 'uri'

		uri = URI.parse("https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13")
		request = Net::HTTP::Post.new(uri)
		request.basic_auth("db18b580-5596-4061-bd52-c2bb869979a5", "f4RHXM5lTTfh")
		request.content_type = "text/plain;charset=utf-8"
		request.body = string

		req_options = {
		  use_ssl: uri.scheme == "https",
		}

		response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
		  http.request(request)
		end

		render :json => response.body

	end




end
