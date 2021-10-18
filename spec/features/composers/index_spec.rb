require 'rails_helper'

RSpec.describe 'Composers Index' do
  before :each do
    @composer_1 = Composer.create!(name:        "Ludwig van Beethoven",
                                   nationality: "German",
                                   active:      false,
                                   total_songs: 722)

  end

  describe 'as a visitor' do
    describe 'when I visit the composers index page' do
      it 'can create a new composer' do
        visit '/composers'

        click_link 'New Composer'

        expect(current_path).to eq("/composers/new")

        fill_in 'Name', with: 'Ludwig von Beethoven'
        fill_in 'Nationality', with: 'German'
        fill_in 'Is Active?', with: false
        fill_in 'Total Songs', with: 722

        click_button

        expect(current_path).to eq('/composers')
        expect(page).to have_content('Ludwig von Beethoven')
      end

      it 'can update a composer' do
        visit '/composers'

        click_link('Edit', match: :first)

        expect(current_path).to eq("/composers/#{@composer_1.id}/edit")

        fill_in 'Name', with: 'Bob'
        fill_in 'Nationality', with: 'Canadian'
        fill_in 'Is currently active?', with: true
        fill_in 'Total Songs', with: 100

        click_button

        expect(current_path).to eq("/composers/#{@composer_1.id}")
        expect(page).to have_content('Bob')
      end

      it 'can delete a composer' do
        visit '/composers'

        click_button('Delete', match: :first)

        expect(current_path).to eq("/composers")
        expect(current_path).to_not have_content(@composer_1.name)
        expect(page).to_not have_button('Delete')
      end

      it '#name' do
        visit "/composers/"

        expect(page).to have_content(@composer_1.name)
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
  end
end