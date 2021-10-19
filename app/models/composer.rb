# app/models/composer.rb

class Composer < ApplicationRecord
  has_many :songs

  def self.order_name
    Composer.order(:name)
  end

  def self.order_created_at
    Composer.order(:created_at)
  end
end