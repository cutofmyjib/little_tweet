class Tweet < ActiveRecord::Base
  validates :body, length: {
    maximum: 140
  }

  belongs_to :user
end
