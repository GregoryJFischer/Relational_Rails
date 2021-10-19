# app/models/orchestra.rb

class Orchestra < ApplicationRecord
  has_many :musicians

  def self.order_name
    Orchestra.order(:name)
  end

  def self.order_created_at
    Orchestra.order(:created_at)
  end
end