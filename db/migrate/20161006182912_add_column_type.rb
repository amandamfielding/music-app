class AddColumnType < ActiveRecord::Migration
  def change
    add_column :albums, :type, :string, null: false
  end
end
