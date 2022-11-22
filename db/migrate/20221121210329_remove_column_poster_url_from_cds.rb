class RemoveColumnPosterUrlFromCds < ActiveRecord::Migration[7.0]
  def change
    remove_column :cds, :poster_url
  end
end
