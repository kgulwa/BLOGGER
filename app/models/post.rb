class Post < ApplicationRecord
  belongs_to :u
  
  #ensures that the user posts have required fields
  validates :title, presence: true
  validates :body, presence: true
end
