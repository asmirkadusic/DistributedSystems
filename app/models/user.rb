class User < ApplicationRecord
  attribute :email, :string
  attribute :password
  validates :email, uniqueness: {case_sensitive: false}  
end
