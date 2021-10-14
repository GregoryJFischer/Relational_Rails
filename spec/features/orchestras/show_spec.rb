require 'rails_helper'

RSpec.describe 'the orchestras show page' do
  before :each do
    @orchestra_1 = Orchestra.create!(name:          "New York Philharmonic",
                                     city:          "New York City",
                                     hiring:        true,
                                     max_musicians: 100)
    @orchestra_2 = Orchestra.create!(name:          "Boston Pops",
                                     city:          "Boston",
                                     hiring:        false,
                                     max_musicians: 120)
  end

  it 'displays the orchetra name' do
    visit "/orchestras/#{@orchestra_1.id}"
    expect(page).to have_content(@orchestra_1.name)

    visit "/orchestras/#{@orchestra_2.id}"
    expect(page).to have_content(@orchestra_2.name)
  end

  it 'displays location' do
    visit "/orchestras/#{@orchestra_1.id}"
    expect(page).to have_content("Location: #{@orchestra_1.city}")

    visit "/orchestras/#{@orchestra_2.id}"
    expect(page).to have_content("Location: #{@orchestra_2.city}")
  end

  xit 'displays the composer nationality' do
    visit "/composers/#{@composer_1.id}"
    expect(page).to have_content("Nationality: #{@composer_1.nationality}")

    visit "/composers/#{@composer_2.id}"
    expect(page).to have_content("Nationality: #{@composer_2.nationality}")
  end

  xit 'displays total songs' do
    visit "/composers/#{@composer_1.id}"
    expect(page).to have_content("Total Songs: #{@composer_1.total_songs}")

    visit "/composers/#{@composer_2.id}"
    expect(page).to have_content("Total Songs: #{@composer_2.total_songs}")
  end
end