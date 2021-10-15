require 'rails_helper'

RSpec.describe 'new' do
  it 'nav' do
    visit "/orchestras/new"

    expect(page).to have_link("Home")
    expect(page).to have_link("Orchestras")
    expect(page).to have_link("Musicians")
    expect(page).to have_link("Composers")
    expect(page).to have_link("Songs")
  end

  it 'content' do
    visit "/orchestras/new"

    expect(page).to have_content("New Orchestra")
    expect(page).to have_content("Enter a New Orchestra")
    expect(page).to have_content("Name:")
    expect(page).to have_content("City:")
    expect(page).to have_content("Is Hiring?")
    expect(page).to have_content("Max Number of Musicians:")
  end

  it 'button' do
    visit "/orchestras/new"

    expect(page).to have_button
  end
end