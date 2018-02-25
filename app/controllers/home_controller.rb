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

		#puts string

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

		#personalityAnalyze = PersonalityAnalyze.new
		#personalityAnalyze.user_id = current_user.id
		#personalityAnalyze.user_data = string
		#personalityAnalyze.save
		@personality_names = Array.new
		@personality_percent = Array.new
		@genre_by_personality = Array.new
		@top_albums = Array.new
		data = JSON.parse(response.body)
		doItRandomly = true
		data["personality"].sort_by{|e| -e["percentile"]}.each do |person|
			temp = {}
			temp2 = {}
			temp = person["name"]
			temp2 = person["percentile"] * 100
			if temp2 > 50.00
				doItRandomly = false
			end
			@personality_names << temp
			@personality_percent << temp2
		end
		@numbers = Array.new
		@randomly = Array.new
		#render :json => rand(0...@personality_names.length - 1)
		begining = 1
		ending = 3
		if doItRandomly
					while begining < ending
						num = rand(0...@personality_names.length - 1)
						if @numbers.include? num
			 				
			 			else
			 				@numbers << num
						end
						if @numbers.length > 2
							begining +=1
						end
					end
					@personality_names.each.with_index do |personality_name, index|
					if @numbers.include? index				
							temp = {}
							tempArray = Array.new
							#temp["tag"] = personality_name
							temp2 = TraitGenre.get_genre_names_by_trait(personality_name)
							temp2.each do |testing| 
								testing.each do |testing2| 
									tempArray << LastFM::Tag.get_top_albums(:tag => "#{testing2.genre.genre_name}", :limit => 6)
								end
							end
							#tempArray << temp
							@top_albums << tempArray
						end
					end
		else
			@personality_names.each do |personality_name|
				temp = {}
				tempArray = Array.new
				#temp["tag"] = personality_name
				temp2 = TraitGenre.get_genre_names_by_trait(personality_name)
				temp2.each do |testing| 
					testing.each do |testing2| 
						tempArray << LastFM::Tag.get_top_albums(:tag => "#{testing2.genre.genre_name}", :limit => 6)
					end
				end
				#tempArray << temp
				@top_albums << tempArray
			end
		end

		#render :json => @top_albums

		#render :json => @top_albums
		
	end




end
