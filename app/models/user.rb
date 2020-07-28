class User < ActiveRecord::Base
  has_many :user_records
  has_many :records, through: :user_records
end