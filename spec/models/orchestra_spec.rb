require 'rails_helper'

RSpec.describe Orchestra do
  it {should have_many :musicians}
end