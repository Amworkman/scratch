class CreateArtistRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_records do |t|
      t.belongs_to :artist
      t.belongs_to :record
    end
  end
end
