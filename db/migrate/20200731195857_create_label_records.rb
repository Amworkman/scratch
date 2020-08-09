class CreateLabelRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :label_records do |t|
      t.belongs_to :label
      t.belongs_to :record
    end
  end
end
