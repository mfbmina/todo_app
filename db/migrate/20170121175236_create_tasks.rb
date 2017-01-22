class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :done, default: false
      t.integer :email_color
      t.integer :email_congratulations
      t.references :todo_list

      t.timestamps
    end
  end
end
