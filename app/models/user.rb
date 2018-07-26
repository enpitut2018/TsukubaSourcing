class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :jobs
  has_many :assigns
  has_many :from_chats, class_name: :Chat, foreign_key: :from_id
  has_many :to_chats, class_name: :Chat, foreign_key: :to_id
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, uniqueness: true
end
