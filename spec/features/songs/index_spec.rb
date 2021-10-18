require 'rails_helper'

RSpec.describe 'Songs Index' do
  before :each do
    @composer = Composer.create!(name:        "Ludwig van Beethoven",
                                 nationality: "German",
                                 active:      false,
                                 total_songs: 722)
    @song_1 = Song.create(name:         "Symphony No. 1 in C",
                         public_domain: true,
                         year_composed: 1800,
                         composer_id:   @composer.id)
  end

  describe 'as a visitor' do
    describe 'when I visit the songs index page' do
      it 'can create a new song' do
        visit '/songs'

        click_link 'New Song'

        expect(current_path).to eq("/songs/new")

        fill_in 'Composer ID', with: "#{@composer.id}"
        fill_in 'Name', with: 'Symphony No. 1 in C'
        fill_in 'Public Domain?', with: true
        fill_in 'Year Composed', with: 1800

        click_button

        expect(current_path).to eq('/songs')
        expect(page).to have_content('Symphony No. 1 in C')
      end

      it 'can update a song' do
        visit '/songs'

        click_link('Edit', match: :first)

        expect(current_path).to eq("/songs/#{@song_1.id}/edit")

        fill_in 'Composer ID', with: "#{@composer.id}"
        fill_in 'Name', with: 'Etude in G'
        fill_in 'Year Composed', with: false
        fill_in 'Public Domain?', with: 1950

        click_button

        expect(current_path).to eq("/songs/#{@song_1.id}")
        expect(page).to have_content('Etude in G')
      end

      it 'can delete a song' do
        visit '/songs'

        click_button('Delete', match: :first)

        expect(current_path).to eq("/songs")
        expect(current_path).to_not have_content(@song_1.name)
        expect(page).to_not have_button('Delete')
      end

      it '#attributes' do
        visit "/songs/"

        expect(page).to have_content(@song_1.name)
        expect(page).to have_content(@song_1.public_domain)
        expect(page).to have_content(@song_1.year_composed)
      end

      it '#home' do
        visit "/songs/"

        expect(page).to have_link("Home")
      end

      it '#new' do
        visit "/songs/"

        expect(page).to have_link("New Song")
      end

      it 'nav' do
        visit "/songs/"

        expect(page).to have_link("Home")
        expect(page).to have_link("Orchestras")
        expect(page).to have_link("Musicians")
        expect(page).to have_link("Composers")
        expect(page).to have_link("Songs")
      end

      it 'edit' do
        visit "/songs/"

        expect(page).to have_link("Edit")
      end

      it 'delete' do
        visit "/songs/"

        expect(page).to have_button("Delete")
      end
    end
  end
end