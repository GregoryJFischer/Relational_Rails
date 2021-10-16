require 'rails_helper'

RSpec.describe 'Edit' do
  before :each do
    @composer = Composer.create!(name:        "Ludwig van Beethoven",
                                  nationality: "German",
                                  active:      false,
                                  total_songs: 722)
  end

  it 'has the correct name' do
    visit "/composers/#{@composer.id}/edit"

    expect(page).to have_content(@composer.name)
  end

  it 'nav' do
    visit "/composers/#{@composer.id}/edit"

    expect(page).to have_link("Home")
    expect(page).to have_link("Orchestras")
    expect(page).to have_link("Musicians")
    expect(page).to have_link("Composers")
    expect(page).to have_link("Songs")
    expect(page).to have_link("#{@composer.name}")
  end

  it 'has a form' do
    visit "/composers/#{@composer.id}/edit"

    expect(page).to have_content("Name:")
    expect(page).to have_content("Nationality:")
    expect(page).to have_content("Is currently active?")
    expect(page).to have_content("Total Songs:")
  end

  it 'has a button' do
    visit "/composers/#{@composer.id}/edit"

    expect(page).to have_button()
  end
end