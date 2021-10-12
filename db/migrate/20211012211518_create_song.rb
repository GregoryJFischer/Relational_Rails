class CreateSong < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :composer_id
      t.string :name
      t.boolean :public_domain
      t.integer :year_composed
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
