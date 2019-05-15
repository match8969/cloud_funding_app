class AddColumnThumbnailToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :thumbnail, :string
  end
end
