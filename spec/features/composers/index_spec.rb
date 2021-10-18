require 'rails_helper'

RSpec.describe 'Composers Index' do
  before :each do
    @composer_1 = Composer.create!(name:        "Ludwig van Beethoven",
                                   nationality: "German",
                                   active:      false,
                                   total_songs: 722)
    @composer_2 = Composer.create!(name: "Andrew Brick",
                                   nationality: "American",
                                   active: true,
                                   total_songs: 100)
  end

  describe 'as a visitor' do
    describe 'when I visit the composers index page' do
      it 'can create a new composer' do
        visit '/composers'

        click_link 'New Composer'

        expect(current_path).to eq('/composers/new')

        fill_in 'composer[name]', with: 'Ludwig von Beethoven'
        fill_in 'composer[nationality]', with: 'German'
        fill_in 'composer[active]', with: false
        fill_in 'composer[total_songs]', with: 722

        click_button

        expect(current_path).to eq('/composers')
        expect(page).to have_content('Ludwig von Beethoven')
      end
    end
  end
  it '#name' do
    visit "/composers/"

    expect(page).to have_content(@composer_1.name)
    expect(page).to have_content(@composer_2.name)
  end

  it '#home' do
    visit "/composers/"

    expect(page).to have_link("Home")
  end

  it '#new' do
    visit "/composers/"

    expect(page).to have_link("New Composer")
  end

  it 'date time' do
    visit "/composers/"

    expect(page).to have_content("#{@composer_1.created_at}")
    expect(page).to have_content("#{@composer_2.created_at}")
  end

  it 'nav' do
    visit "/composers/"

    expect(page).to have_link("Home")
    expect(page).to have_link("Orchestras")
    expect(page).to have_link("Musicians")
    expect(page).to have_link("Composers")
    expect(page).to have_link("Songs")
  end

  it 'edit' do
    visit "/composers/"

    expect(page).to have_link("Edit")
  end

  it 'delete' do
    visit "/composers/"

    expect(page).to have_button("Delete")
  end

end