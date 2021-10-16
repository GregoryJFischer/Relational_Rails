# app/models/composer.rb

class Composer < ApplicationRecord
  has_many :songs

  def self.order_name
    Composer.order(:name)
  end
end