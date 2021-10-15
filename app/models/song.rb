# app/models/song.rb

class Song < ApplicationRecord
  belongs_to :composer

  def self.true?
    Song.where(public_domain: :true)
  end
end