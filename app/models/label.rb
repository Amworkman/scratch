class Label < ActiveRecord::Base
  has_many :records
  has_many :artists, through: :records
end