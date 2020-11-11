class TweetsController < ApplicationController

    def index
        begin
            render(status: 200, json: {tweets: Tweet.all})
        rescue => error
            render(status: 500, json: {error: "Internal Server Error: #{error.message}"})
        end        
    end

    def show 
        begin
            render(status: 200, json: {tweet: Tweet.find(params[:id])})
        rescue ActiveRecord::RecordNotFound 
            render(status: 400, json: {error: "Tweet not found with id: #{params[:id]}"})
        rescue  => error
            render(status: 500, json: {error: "Internal Server Error: #{error.message}"})
        end

    end

    # Tested with cURL expression below
    # curl -X POST -d "tweet[title]=Crentist" -d "tweet[author]=Dwight" -d tweet[content]="My dentist's name is Crentist, maybe that's why he became a dentist" localhost:3000/tweets
    def create
        begin 
            new_tweet = Tweet.new(tweet_params)
            if new_tweet.save()
                render(status: 201, json: {tweet: new_tweet})
            else
                render(status: 422, json: {error: new_tweet.errors})
            end
        rescue  => error
            render(status: 500, json: {error: "Internal Server Error: #{error.message}"})
        end
    end

    private 

    def tweet_params # strong params for create
        params.require(:tweet).permit(:title, :content, :author)
    end

end