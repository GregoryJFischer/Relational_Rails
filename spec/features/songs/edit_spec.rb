require 'rails_helper'

RSpec.describe 'Edit' do
  before :each do
    @composer = Composer.create!(name:        "Ludwig van Beethoven",
                                 nationality: "German",
                                 active:      false,
                                 total_songs: 722)
    @song = Song.create(name:         "Symphony No. 1 in C",
                          public_domain: true,
                          year_composed: 1800,
                          composer_id:   @composer.id)
  end

  it 'has the correct name' do
    visit "/songs/#{@song.id}/edit"

    expect(page).to have_content(@song.name)
  end

  it 'nav' do
    visit "/songs/#{@song.id}/edit"

    expect(page).to have_link("Home")
    expect(page).to have_link("Orchestras")
    expect(page).to have_link("Musicians")
    expect(page).to have_link("Composers")
    expect(page).to have_link("Songs")
    expect(page).to have_link("#{@song.name}")
  end

  it 'has a form' do
    visit "/songs/#{@song.id}/edit"

    expect(page).to have_content("Name:")
    expect(page).to have_content("Year Composed:")
    expect(page).to have_content("Public Domain?")
  end

  it 'has a button' do
    visit "/songs/#{@song.id}/edit"

    expect(page).to have_button()
  end
end