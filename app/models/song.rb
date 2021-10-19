# app/models/song.rb

class Song < ApplicationRecord
  belongs_to :composer

  def self.true?
    Song.where(public_domain: :true)
  end

  def self.order_name
    Song.order(:name)
  end

  def self.modern_check(input)
    Song.where("year_composed > #{input}")
  end
end