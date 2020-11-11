class MetaController < ApplicationController

    def about
        tweet = {
            "id": 1,
            "title": "Just found this",
            "content": "the square of the hypotenuse is equal to the sum of the squares of the other two sides",
            "author": "Pythagoras570"
        }
        render(status: 200, json: { tweet_sample: tweet })
    end

end