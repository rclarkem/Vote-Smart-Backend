class RepresentativesUsers < ApplicationRecord
  belongs_to :user
  belongs_to :representative
end
