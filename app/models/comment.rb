class Comment < ApplicationRecord
  belongs_to :post
  validates :commentor, presence: true
end
