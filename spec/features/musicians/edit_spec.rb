require 'rails_helper'

RSpec.describe 'Edit' do
  before :each do
    @orchestra = Orchestra.create!(name:          "New York Philharmonic",
                                   city:          "New York City",
                                   hiring:        true,
                                   max_musicians: 100)
    @musician = Musician.create(name:         "Nancy Drew",
                                  hirable:      true,
                                  age:          22,
                                  orchestra_id: @orchestra.id)
  end

  it 'has the correct name' do
    visit "/musicians/#{@musician.id}/edit"

    expect(page).to have_content(@musician.name)
  end

  it 'nav' do
    visit "/musicians/#{@musician.id}/edit"

    expect(page).to have_link("Home")
    expect(page).to have_link("Orchestras")
    expect(page).to have_link("Musicians")
    expect(page).to have_link("Composers")
    expect(page).to have_link("Songs")
  end

  xit 'has a form' do
    visit "/orchestras/#{@orchestra.id}/edit"

    expect(page).to have_content("Name:")
    expect(page).to have_content("City:")
    expect(page).to have_content("Is Hiring?")
    expect(page).to have_content("Max Number of Musicians:")
  end

  xit 'has a button' do
    visit "/orchestras/#{@orchestra.id}/edit"

    expect(page).to have_button()
  end
end