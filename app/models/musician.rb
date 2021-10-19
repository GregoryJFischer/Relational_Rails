# app/models/musician.rb

class Musician < ApplicationRecord
  belongs_to :orchestra

  def self.true?
    Musician.where(hirable: :true)
  end

  def self.order_name
    Musician.order(:name)
  end

  def self.age_check(input)
    Musician.where("age > #{input}")
  end
end