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

  xit 'displays location' do
    visit "/orchestras/#{@orchestra_1.id}"
    expect(page).to have_content("Location: #{@orchestra_1.city}")

    visit "/orchestras/#{@orchestra_2.id}"
    expect(page).to have_content("Location: #{@orchestra_2.city}")
  end

  xit 'displays the max musicians' do
    visit "/orchestras/#{@orchestra_1.id}"
    expect(page).to have_content("Maximum Number of Musicians: #{@orchestra_1.max_musicians}")

    visit "/orchestras/#{@orchestra_2.id}"
    expect(page).to have_content("Maximum Number of Musicians: #{@orchestra_2.max_musicians}")
  end

  xit 'displays hiring' do
    visit "/orchestras/#{@orchestra_1.id}"
    expect(page).to have_content("Is currently hiring: #{@orchestra_1.hiring}")

    visit "/orchestras/#{@orchestra_2.id}"
    expect(page).to have_content("Is currently hiring: #{@orchestra_2.hiring}")
  end
end