class Label < ActiveRecord::Base
  has_many :records, through: :label_records
  has_many :lebel_records
end