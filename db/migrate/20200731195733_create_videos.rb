class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :uri
      t.string :description
      t.integer :duration
      t.boolean :embeded
      t.belongs_to :record
    end
  end
end
