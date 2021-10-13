# app/models/orchestra.rb

class Orchestra < ApplicationRecord
  has_many :musicians 
end