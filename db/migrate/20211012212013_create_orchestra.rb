class CreateOrchestra < ActiveRecord::Migration[5.2]
  def change
    create_table :orchestras do |t|
      t.string :name
      t.string :city
      t.boolean :hiring
      t.integer :max_musicians
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
