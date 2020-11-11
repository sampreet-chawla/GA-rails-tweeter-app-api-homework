class Tweet < ApplicationRecord
    # https://guides.rubyonrails.org/active_record_validations.html#uniqueness
    validates :title, :content, :author, presence: true
    validates :title, uniqueness: true # By default: { case_sensitive: true }
    # validates :title, uniqueness: { case_sensitive: false }
end