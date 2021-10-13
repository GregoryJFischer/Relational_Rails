# app/models/composer.rb

class Composer < ApplicationRecord
  has_many :songs
end