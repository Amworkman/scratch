class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :title
      t.string :image_url
      t.string :release_date
      t.string :lowest_price
      t.string :num_for_sale
      t.string :thumb
    end
  end
end
