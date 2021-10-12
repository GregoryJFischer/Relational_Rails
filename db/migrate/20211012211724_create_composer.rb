class CreateComposer < ActiveRecord::Migration[5.2]
  def change
    create_table :composers do |t|
      t.string :name
      t.string :nationality
      t.boolean :active
      t.integer :total_songs
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
