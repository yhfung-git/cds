class AddDetailsToCds < ActiveRecord::Migration[7.0]
  def change
    add_column :cds, :category, :string
    add_column :cds, :available, :boolean, default: true
  end
end
