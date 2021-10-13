class CreateMusician < ActiveRecord::Migration[5.2]
  def change
    create_table :musicians do |t|
      t.integer :orchestra_id
      t.string :name
      t.boolean :hirable
      t.integer :age
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
