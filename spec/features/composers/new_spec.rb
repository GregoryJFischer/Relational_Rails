require 'rails_helper'

RSpec.describe 'New' do
  it 'has navigation' do
    visit "/composers/new"

    expect(page).to have_link("Home")
    expect(page).to have_link("Orchestras")
    expect(page).to have_link("Musicians")
    expect(page).to have_link("Composers")
    expect(page).to have_link("Songs")
  end

  it 'has page heading' do
    visit "/composers/new"

    expect(page).to have_content("New Composers")
  end
end