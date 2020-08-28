class AddPurchasePriceToUserRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :user_records, :purchase_price, :string
  end
end
