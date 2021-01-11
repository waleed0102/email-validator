class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :url, :email
  validates :email, uniqueness: true
end
