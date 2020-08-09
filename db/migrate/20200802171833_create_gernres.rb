class CreateGernres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :style
      t.belongs_to :record
    end
  end
end
