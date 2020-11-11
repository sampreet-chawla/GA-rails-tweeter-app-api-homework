class TweetsController < ApplicationController

    def index
        begin
            render(status: 200, json: {tweets: Tweet.all})
        rescue Exception => e
            render(status: 500, json: {error: "Internal Server Error: #{e.message}"})
        end
    end

    def show 
        begin
            render(status: 200, json: {tweet: Tweet.find(params[:id])})
        rescue ActiveRecord::RecordNotFound 
            render(status: 400, json: {error: "Tweet not found with id: #{params[:id]}"})
        rescue  Exception => e
            render(status: 500, json: {error: "Internal Server Error: #{e.message}"})
        end
    end
end