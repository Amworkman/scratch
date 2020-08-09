class CreateUserRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :user_records do |t|
      t.belongs_to :record
      t.belongs_to :user
    end
  end
end
