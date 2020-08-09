class Artist < ActiveRecord::Base
  has_many :artist_records
  has_many :records, through: :artist_records

end