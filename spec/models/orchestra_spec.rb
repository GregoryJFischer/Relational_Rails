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

  it '#order_name' do
    expect(Orchestra.order_name.first).to eq @orchestra_1
    expect(Orchestra.order_name.last).to eq @orchestra_3
  end

  it '#order_created_at' do
    expect(Orchestra.order_created_at.first).to eq @orchestra_1
    expect(Orchestra.order_created_at.last).to eq @orchestra_3
  end
end