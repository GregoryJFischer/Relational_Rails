# app/models/orchestra.rb

class Orchestra < ApplicationRecord
  has_many :musicians

  def self.order_name
    Orchestra.order(:name)
  end
end