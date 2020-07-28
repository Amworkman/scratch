class CreateUserRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :user_records do |t|
      t.integer :record_id
      t.integer :user_id
    end
  end
end
