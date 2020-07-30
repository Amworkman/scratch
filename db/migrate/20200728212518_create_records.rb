class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :title
      title.string :barcode
      t.string :catalog_number
      t.integer :artist_id
      t.integer :label_id
      t.interger :discogs_id
      t.string :image_url
      t.string :genres
      t.string :year
      t.string :lowest_price
      t.string :num_for_sale
    end
  end
end
