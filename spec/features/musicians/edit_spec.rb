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
    expect(page).to have_link("#{@musician.name}")

  end

  it 'has a form' do
    visit "/musicians/#{@musician.id}/edit"

    expect(page).to have_content("Name:")
    expect(page).to have_content("Age:")
    expect(page).to have_content("Hirable?")
  end

  it 'has a button' do
    visit "/musicians/#{@musician.id}/edit"

    expect(page).to have_button()
  end
end