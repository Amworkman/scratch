class Artist < ActiveRecord::Base
  has_many :records
  has_many :lables, through: :records
end