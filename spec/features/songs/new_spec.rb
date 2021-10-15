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

  it 'content' do
    visit "/songs/new"

    expect(page).to have_content("New Song")
    expect(page).to have_content("Enter a New Song")
    expect(page).to have_content("Composer ID:")
    expect(page).to have_content("Name:")
    expect(page).to have_content("Is Public Domain?")
    expect(page).to have_content("Year Composed:")
  end

  it 'button' do
    visit "/songs/new"

    expect(page).to have_button
  end
end