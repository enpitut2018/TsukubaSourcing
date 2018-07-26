class Job < ApplicationRecord
  belongs_to :user
  has_many :assigns
  has_many :chats
end
