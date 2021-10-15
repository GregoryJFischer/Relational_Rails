require 'rails_helper'

RSpec.describe 'New' do
  it 'nav' do
    visit "/composers/new"

    expect(page).to have_link("Home")
    expect(page).to have_link("Orchestras")
    expect(page).to have_link("Musicians")
    expect(page).to have_link("Composers")
    expect(page).to have_link("Songs")
  end

  it 'has content' do
    visit "/composers/new"

    expect(page).to have_content("New Composers")
    expect(page).to have_content("Enter a New Composer")
    expect(page).to have_content("Name:")
    expect(page).to have_content("Nationality:")
    expect(page).to have_content("Is Active?")
    expect(page).to have_content("Total Songs:")
  end
end