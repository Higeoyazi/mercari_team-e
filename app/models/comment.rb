class Comment < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :product

  #validation
  validates :text,  presence: true
end
