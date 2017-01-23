class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.integer :event
      t.json :data

      t.timestamps
    end
  end
end
