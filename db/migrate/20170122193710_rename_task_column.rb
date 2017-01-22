class RenameTaskColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :done, :closed
  end
end
