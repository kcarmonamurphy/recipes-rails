class Chef < ApplicationRecord
  validates :chefname, presence: true, length: {
    maximum: 30
  }

  VALID_EMAIL_REGEX =  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :email, presence: true, length: { maximum: 255 }, format: {
    with: VALID_EMAIL_REGEX
  }, uniqueness: { case_sensitive: false }

  
  #has_many :recipes
end
