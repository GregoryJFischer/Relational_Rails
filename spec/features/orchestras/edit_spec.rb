require 'rails_helper'

RSpec.describe 'Edit' do
  before :each do
    @orchestra = Orchestra.create!(name:          "New York Philharmonic",
                                    city:          "New York City",
                                    hiring:        true,
                                    max_musicians: 100)
  end

  it 'has the correct name' do
    visit "/orchestras/#{@orchestra.id}/edit"

    expect(page).to have_content(@orchestra.name)
  end

  it 'nav' do
    visit "/orchestras/#{@orchestra.id}/edit"

    expect(page).to have_link("Home")
    expect(page).to have_link("Orchestras")
    expect(page).to have_link("Musicians")
    expect(page).to have_link("Composers")
    expect(page).to have_link("Songs")
    expect(page).to have_link("#{@orchestra.name}")
  end

  it 'has a form' do
    visit "/orchestras/#{@orchestra.id}/edit"

    expect(page).to have_content("Name:")
    expect(page).to have_content("City:")
    expect(page).to have_content("Is Hiring?")
    expect(page).to have_content("Max Number of Musicians:")
  end

  it 'has a button' do
    visit "/orchestras/#{@orchestra.id}/edit"

    expect(page).to have_button()
  end
end