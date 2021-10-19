require 'rails_helper'

RSpec.describe Composer do
  before :each do
    @composer = Composer.create!(name: "Mozart")

    @song_1 = @composer.songs.create!({ 
       name: "minuet",
       composer_id: @composer.id,
       public_domain: true,
       year_composed: 1234
     })

     @song_2 = @composer.songs.create!({ 
      name: "Clarinet Concerto in A",
      composer_id: @composer.id,
      public_domain: true,
      year_composed: 1233
    })
  end
  it {should have_many :songs}

  it '#order_name' do
    expect(Composer.order_name.first).to eq @composer
  end

  it '#order_created_at' do
    composer_2 = Composer.create!(name: "bob")
    
    expect(Composer.order_created_at.first).to eq @composer
    expect(Composer.order_created_at.last).to eq composer_2
  end
end