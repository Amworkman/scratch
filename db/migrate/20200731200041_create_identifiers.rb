class CreateIdentifiers < ActiveRecord::Migration[5.2]
  def change
    create_table :identifiers do |t|
      t.string :type_of_info
      t.string :value
      t.string :description
      t.belongs_to :record
    end
  end
end
