# app/models/song.rb

class Song < ApplicationRecord
  belongs_to :composer
end