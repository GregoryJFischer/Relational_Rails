require 'rails_helper'

RSpec.describe 'the composers show page' do
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
    describe 'when I visit the musicians index page' do
      it 'displays the composer name' do
        visit "/composers/#{@composer_1.id}"
        expect(page).to have_content(@composer_1.name)

        visit "/composers/#{@composer_2.id}"
        expect(page).to have_content(@composer_2.name)
      end

      it 'displays composer status' do
        visit "/composers/#{@composer_1.id}"
        expect(page).to have_content("Is currently active: #{@composer_1.active}")

        visit "/composers/#{@composer_2.id}"
        expect(page).to have_content("Is currently active: #{@composer_2.active}")
      end

      it 'displays the composer nationality' do
        visit "/composers/#{@composer_1.id}"
        expect(page).to have_content("Nationality: #{@composer_1.nationality}")

        visit "/composers/#{@composer_2.id}"
        expect(page).to have_content("Nationality: #{@composer_2.nationality}")
      end

      it 'displays total songs' do
        visit "/composers/#{@composer_1.id}"
        expect(page).to have_content("Total Songs: #{@composer_1.total_songs}")

        visit "/composers/#{@composer_2.id}"
        expect(page).to have_content("Total Songs: #{@composer_2.total_songs}")
      end

      it 'displays the total number of songs' do
        visit "/composers/#{@composer_1.id}"
        expect(page).to have_content("Number of songs available: #{@composer_1.songs.count}")

        visit "/composers/#{@composer_2.id}"
        expect(page).to have_content("Number of songs available: #{@composer_2.songs.count}")
      end

      it 'can delete a composer' do
        visit "/composers/#{@composer_1.id}"

        save_and_open_page
        click_button('Delete', match: :first)

        expect(current_path).to eq("/composers")
        expect(current_path).to_not have_content(@composer_1.name)
      end

      it 'nav' do
        visit "/composers/#{@composer_1.id}"

        expect(page).to have_link("Home")
        expect(page).to have_link("Orchestras")
        expect(page).to have_link("Musicians")
        expect(page).to have_link("Composers")
        expect(page).to have_link("Songs")
      end

      it 'delete' do
        visit "/composers/#{@composer_1.id}"

        expect(page).to have_button("Delete")
      end
    end
  end
end