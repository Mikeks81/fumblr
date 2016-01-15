class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	validates :email, presence: true, uniqueness: true 
	validates :username, presence: true, length: {in: 4..30}, uniqueness: true 
	validates :password, presence: true, length: {in: 6..8}
end
