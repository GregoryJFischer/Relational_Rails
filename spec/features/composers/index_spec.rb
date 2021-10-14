require 'rails_helper'

RSpec.describe 'Composers Index' do
  before :each do
    @composer_1 = Composer.create!(name:      "Ludwig van Beethoven",
                                   nationality: "German",
                                   active:      false,
                                   total_songs: 722)
    @composer_2 = Composer.create!(name: "Andrew Brick",
                                   nationality: "American",
                                   active: true,
                                   total_songs: 100)
  end

  it 'shows each composer name' do
    visit "/composers/"

    expect(page).to have_content(@composer_1.name)
    expect(page).to have_content(@composer_2.name)
  end
end