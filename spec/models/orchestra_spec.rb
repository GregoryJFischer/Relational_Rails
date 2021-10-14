require 'rails_helper'

RSpec.describe Orchestra do
  before :each do
    @orchestra_1 = Orchestra.create(name: 'orchestra 1', 
                                    city: 'city 1',
                                    hiring: true,
                                    max_musicians: 1)
    @orchestra_2 = Orchestra.create(name: 'orchestra 2', 
                                    city: 'city 2',
                                    hiring: true,
                                    max_musicians: 2)
    @orchestra_3 = Orchestra.create(name: 'orchestra 3', 
                                    city: 'city 3',
                                    hiring: false,
                                    max_musicians: 3)
  end
  it {should have_many :musicians}
end