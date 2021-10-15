require 'rails_helper'

RSpec.describe 'new' do
  it 'nav' do
    visit "/songs/new"

    expect(page).to have_link("Home")
    expect(page).to have_link("Orchestras")
    expect(page).to have_link("Musicians")
    expect(page).to have_link("Composers")
    expect(page).to have_link("Songs")
  end
end