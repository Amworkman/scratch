class LabelRecord < ActiveRecord::Base
  belongs_to :record
  belongs_to :label
end