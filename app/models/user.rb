class User < ApplicationRecord
  attr_accessor :email, :password
  validates :email, uniqueness: {case_sensitive: false}
  
end
