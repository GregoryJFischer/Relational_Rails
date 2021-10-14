require 'rails_helper'

RSpec.describe Song do
  it {should belong_to :composer}
end