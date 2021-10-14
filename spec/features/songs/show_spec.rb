require 'rails_helper'

RSpec.describe 'the orchestras show page' do
  before :each do
    @composer = Composer.create!(name:        "Ludwig van Beethoven",
                                 nationality: "German",
                                 active:      false,
                                 total_songs: 722)
    @song_1 = Song.create(name:         "Symphony No. 1 in C",
                         public_domain: true,
                         year_composed: 1800,
                         composer_id:   @composer.id)
    @song_2 = Song.create(name:         "String Quartet No. 3 in D",
                         public_domain: true,
                         year_composed: 1799,
                         composer_id:   @composer.id)
  end

  it 'displays the song name' do
    visit "/songs/#{@song_1.id}"
    expect(page).to have_content(@song_1.name)

    visit "/songs/#{@song_2.id}"
    expect(page).to have_content(@song_2.name)
  end

  it 'displays public domain' do
    visit "/songs/#{@song_1.id}"
    expect(page).to have_content("Is public_domain: #{@song_1.public_domain}")

    visit "/songs/#{@song_2.id}"
    expect(page).to have_content("Is public_domain: #{@song_2.public_domain}")
  end

  it 'displays composed year' do
    visit "/songs/#{@song_1.id}"
    expect(page).to have_content("Composed in: #{@song_1.year_composed}")

    visit "/songs/#{@song_2.id}"
    expect(page).to have_content("Composed in: #{@song_2.year_composed}")
  end
end