class AddPhotoToCd < ActiveRecord::Migration[7.0]
  def change
    add_column :cds, :poster_url, :string
  end
end
