class Company < ApplicationRecord
  has_many :buildings, as: :owner
end
