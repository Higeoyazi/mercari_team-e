class Address < ApplicationRecord

  # Association
  belongs_to :user, optional: true

  # Validation
  
end
