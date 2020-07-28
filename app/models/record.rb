class Record < ActiveRecord::Base
  belongs_to :artist
  belongs_to :lable
  has_many :user_records
  has_many :users, through: :user_records
end