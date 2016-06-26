class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :author_id, null: false
      t.integer :track_id, null: false
      t.text :content, null: false

      t.timestamps(null: false)
    end
  end
end
