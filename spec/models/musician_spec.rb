require 'rails_helper'

RSpec.describe Musician, type: :model do
  it {should belong_to :orchestra}
end