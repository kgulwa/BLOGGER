class Post < ApplicationRecord
  belongs_to :user
  
  #ensures that the user posts have required fields
  validates :title, presence: true
  validates :body, presence: true
end
