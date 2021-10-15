require 'rails_helper'

RSpec.describe 'new' do
  it 'nav' do
    visit "/musicians/new"

    expect(page).to have_link("Home")
    expect(page).to have_link("Orchestras")
    expect(page).to have_link("Musicians")
    expect(page).to have_link("Composers")
    expect(page).to have_link("Songs")
  end

  it 'content' do
    visit "/musicians/new"

    expect(page).to have_content("New Musician")
    expect(page).to have_content("Enter a New Musician")
    expect(page).to have_content("Orchestra ID:")
    expect(page).to have_content("Name:")
    expect(page).to have_content("Is Looking for Work?")
    expect(page).to have_content("Age:")
  end

  it 'button' do
    visit "/musicians/new"

    expect(page). to have_button
  end
end