class Profile < ApplicationRecord
  # Association
  belongs_to :user, optional: true
end
