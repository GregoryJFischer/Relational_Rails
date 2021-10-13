require 'rails_helper'

RSpec.describe Composer do
  it {should have_many :songs}

end