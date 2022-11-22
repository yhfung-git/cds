class AddPriceToCd < ActiveRecord::Migration[7.0]
  def change
    add_column :cds, :price, :integer
  end
end
