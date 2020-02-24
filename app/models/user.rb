class User < ApplicationRecord
  validates :username, presence: true, length: {minimum:5, maximum:10}, uniqueness: {case_sensitive: false}
  has_secure_password
  has_many :posts
  has_many :comments
end
