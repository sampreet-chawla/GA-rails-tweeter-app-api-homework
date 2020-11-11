class Tweet < ApplicationRecord
    validates :title, :content, :author, presence: true
end