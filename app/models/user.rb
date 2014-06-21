class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_many :votes

	has_secure_password validations: false

	validates :username, presence: true
	validates :password, presence: true, on: :create
end