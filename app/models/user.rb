class User < ApplicationRecord
  has_many :users_representatives
  has_many :representatives, through: :users_representatives
end
