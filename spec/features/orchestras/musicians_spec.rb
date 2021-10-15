require 'rails_helper'

RSpec.describe 'Orchestra Musicians' do
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

  it '#attributes' do
    visit "/orchestras/#{@orchestra.id}/musicians"

    expect(page).to have_content(@musician_1.name)
    expect(page).to have_content(@musician_1.hirable)
    expect(page).to have_content(@musician_1.age)
    expect(page).to have_no_content(@musician_2)

    expect(page).to have_content(@musician_2.name)
    expect(page).to have_content(@musician_2.hirable)
    expect(page).to have_content(@musician_2.age)
    expect(page).to have_no_content(@musician_1)
  end

  it '#home' do
    visit "/orchestras/#{@orchestra.id}/musicians"

    expect(page).to have_link("Home")
  end

  it 'nav' do
    visit "/orchestras/#{@orchestra.id}/musicians"

    expect(page).to have_link("Home")
    expect(page).to have_link("Orchestras")
    expect(page).to have_link("Musicians")
    expect(page).to have_link("Composers")
    expect(page).to have_link("Songs")
  end
end