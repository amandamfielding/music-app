class RenameColumnNote < ActiveRecord::Migration
  def change
    rename_column :notes, :note, :review
  end
end
