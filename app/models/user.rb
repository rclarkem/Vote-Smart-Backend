class User < ApplicationRecord
  has_many :representatives_users
  has_many :representatives, through: :representatives_users
end
