require 'rails_helper'

RSpec.describe 'Songs Index' do
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

  it 'lists all song attributes' do
    visit "/songs/"

    expect(page).to have_content(@song_1.name)
    expect(page).to have_content(@song_1.public_domain)
    expect(page).to have_content(@song_1.year_composed)
    expect(page).to have_no_content(@song_2)

    expect(page).to have_content(@song_2.name)
    expect(page).to have_content(@song_2.public_domain)
    expect(page).to have_content(@song_2.year_composed)
    expect(page).to have_no_content(@song_1)
  end
end