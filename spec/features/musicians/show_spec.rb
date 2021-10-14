require 'rails_helper'

RSpec.describe 'the musicians show page' do
  before :each do
    @orchestra = Orchestra.create!(name:          "New York Philharmonic",
                                   city:          "New York City",
                                   hiring:        true,
                                   max_musicians: 100)
    @musician_1 = Musician.create(name:         "Nancy Drew",
                                  hirable:      true,
                                  age:          22,
                                  orchestra_id: @orchestra.id)
    @musician_2 = Musician.create(name:         "Michael Scott",
                                  hirable:      false,
                                  age:          50,
                                  orchestra_id: @orchestra.id)
  end

  it 'displays the musician name' do
    visit "/musicians/#{@musician_1.id}"
    expect(page).to have_content(@musician_1.name)

    visit "/musicians/#{@musician_2.id}"
    expect(page).to have_content(@musician_2.name)
  end

  xit 'displays public domain' do
    visit "/songs/#{@song_1.id}"
    expect(page).to have_content("Is public_domain: #{@song_1.public_domain}")

    visit "/songs/#{@song_2.id}"
    expect(page).to have_content("Is public_domain: #{@song_2.public_domain}")
  end

  xit 'displays composed year' do
    visit "/songs/#{@song_1.id}"
    expect(page).to have_content("Composed in: #{@song_1.year_composed}")

    visit "/songs/#{@song_2.id}"
    expect(page).to have_content("Composed in: #{@song_2.year_composed}")
  end
end