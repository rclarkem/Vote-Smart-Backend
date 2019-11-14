class User < ApplicationRecord
  has_many :representatives_users
  has_many :representatives, through: :representatives_users

  def bills
    representatives_users.map do |representatives_user|
      Bill.new(representatives_user.bill_id).bill.merge({user_vote_for: representatives_user.vote})
    end
  end
end
