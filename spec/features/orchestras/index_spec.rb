require 'rails_helper'

RSpec.describe 'Orchestras Index' do
  before :each do
    @orchestra_1 = Orchestra.create!(name:          "New York Philharmonic",
                                     city:          "New York City",
                                     hiring:        true,
                                     max_musicians: 100)

  end

  describe 'as a visitor' do
    describe 'when I visit the orchestras index page' do
      it 'can create a new composer' do
        visit '/orchestras'

        click_link 'New Orchestra'

        expect(current_path).to eq("/orchestras/new")

        fill_in 'orchestra[name]', with: 'New York Philharmonic'
        fill_in 'orchestra[city]', with: 'New York City'
        fill_in 'orchestra[hiring]', with: true
        fill_in 'orchestra[max_musicians]', with: 100

        click_button

        expect(current_path).to eq('/orchestras')
        expect(page).to have_content('New York Philharmonic')
      end

      it 'can update an orchestra' do
        visit '/orchestras'

        click_link('Edit', match: :first)

        expect(current_path).to eq("/orchestras/#{@orchestra_1.id}/edit")

        fill_in 'orchestra[name]', with: 'New York Orchestra'
        fill_in 'orchestra[city]', with: 'New York'
        fill_in 'orchestra[hiring]', with: false
        fill_in 'orchestra[max_musicians]', with: 100

        click_button

        expect(current_path).to eq("/orchestras/#{@orchestra_1.id}")
        expect(page).to have_content('New York Orchestra')
      end

      it 'can delete an orchestra' do
        visit '/orchestras'

        save_and_open_page
        click_button('Delete', match: :first)

        expect(current_path).to eq("/orchestras")
        expect(current_path).to_not have_content(@orchestra_1.name)
        expect(page).to_not have_button('Delete')
      end
      
      it '#name' do
        visit "/orchestras/"

        expect(page).to have_content(@orchestra_1.name)
      end

      it '#home' do
        visit "/orchestras/"

        expect(page).to have_link("Home")
      end

      it '#new' do
        visit "/orchestras/"

        expect(page).to have_link("New Orchestra")
      end

      it 'show created at time' do
        visit "/orchestras/"

        expect(page).to have_content("#{@orchestra_1.created_at}")
      end

      it 'nav' do
        visit "/orchestras/"

        expect(page).to have_link("Home")
        expect(page).to have_link("Orchestras")
        expect(page).to have_link("Musicians")
        expect(page).to have_link("Composers")
        expect(page).to have_link("Songs")
      end

      it 'edit' do
        visit "/orchestras/"

        expect(page).to have_link("Edit")
      end

      it 'delete' do
        visit "/orchestras/"

        expect(page).to have_button("Delete")
      end
    end
  end
end