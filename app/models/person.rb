class Person < ApplicationRecord
  has_many :buildings, as: :owner
end
