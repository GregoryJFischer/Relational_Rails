require 'rails_helper'

RSpec.describe Song do
  before(:each) do
    @composer = Composer.create!(name:        "Ludwig van Beethoven",
      nationality: "German",
      active:      false,
      total_songs: 722)
    @song_1 = Song.create(name:         "Symphony No. 1 in C",
                          public_domain: true,
                          year_composed: 1800,
                          composer_id:   @composer.id)
    @song_2 = Song.create(name:         "String Quartet No. 3 in D",
                          public_domain: false,
                          year_composed: 1798,
                          composer_id:   @composer.id)
  end
  it {should belong_to :composer}

  it '#true?' do
    expect(Song.true?.length).to eq 1
    expect(Song.true?[0]).to eq @song_1
    expect(Song.true?.include?(@song_2)).to be false
  end

  it 'order_name' do
    expect(Song.order_name.first).to eq @song_2
    expect(Song.order_name.last).to eq @song_1
  end

  it 'can limit songs by how old they are' do
    expect(Song.modern_check(1799)).to eq([@song_1])
  end
end