class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :info , presence:true, length: {minimum:1, maximum:30}
end
