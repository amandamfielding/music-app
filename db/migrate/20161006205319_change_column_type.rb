class ChangeColumnType < ActiveRecord::Migration
  def change
    rename_column :albums, :type, :source
    rename_column :tracks, :type, :category
  end
end
