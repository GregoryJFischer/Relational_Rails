require 'rails_helper'

RSpec.describe 'Musicians Index' do
  before :each do
    @orchestra = Orchestra.create!(name:          "New York Philharmonic",
                                   city:          "New York City",
                                   hiring:        true,
                                   max_musicians: 100)
    @musician_1 = Musician.create(name:         "Nancy Drew",
                                  hirable:      true,
                                  age:          22,
                                  orchestra_id: @orchestra.id)
    @musician_2 = Musician.create(name: "Bob",
                                  hirable: true,
                                  age: 80,
                                  orchestra_id: @orchestra.id)
  end

  describe 'as a visitor' do
    describe 'when I visit the musicians index page' do
      it 'can create a new musician' do
        visit '/musicians'

        click_link 'New Musician'

        expect(current_path).to eq("/musicians/new")

        fill_in 'Orchestra ID', with: "#{@orchestra.id}"
        fill_in 'Name', with: 'Nancy Drew'
        fill_in 'Is Looking for Work?', with: true
        fill_in 'Age', with: 22

        click_button

        expect(current_path).to eq('/musicians')
        expect(page).to have_content('Nancy Drew')
      end

      it 'can update a musician' do
        visit '/musicians'

        click_link('Edit', match: :first)

        expect(current_path).to eq("/musicians/#{@musician_1.id}/edit")

        fill_in 'Orchestra ID', with: "#{@orchestra.id}"
        fill_in 'Name', with: 'Ben LaGue'
        fill_in 'Age', with: 32
        fill_in 'Hirable?', with: false

        click_button

        expect(current_path).to eq("/musicians/#{@musician_1.id}")
        expect(page).to have_content('Ben LaGue')
      end

      it 'can delete a musician' do
        visit '/musicians'

        click_button('Delete', match: :first)
        click_button('Delete', match: :first)

        expect(current_path).to eq("/musicians")
        expect(current_path).to_not have_content(@musician_1.name)
        expect(page).to_not have_button('Delete')
      end

      it 'can order by name' do
        visit "/musicians?order=true"

        expect("Bob").to appear_before("Nancy Drew")
      end

      it '#attributes' do
        visit "/musicians/"

        expect(page).to have_content(@musician_1.name)
        expect(page).to have_content(@musician_1.hirable)
        expect(page).to have_content(@musician_1.age)
      end

      it '#home' do
        visit "/musicians/"

        expect(page).to have_link("Home")
      end

      it '#new' do
        visit "/musicians/"

        expect(page).to have_link("New Musician")
      end

      it 'nav' do
        visit "/musicians/"

        expect(page).to have_link("Home")
        expect(page).to have_link("Orchestras")
        expect(page).to have_link("Musicians")
        expect(page).to have_link("Composers")
        expect(page).to have_link("Songs")
      end

      it 'edit' do
        visit "/musicians/"

        expect(page).to have_link("Edit")
      end

      it 'delete' do
        visit "/musicians/"

        expect(page).to have_button("Delete")
      end

      it 'can limit results by age' do
        visit "/musicians"

        expect(page).to have_content("Limit to Musicians Over Age:")

        fill_in "Limit to Musicians Over Age:", with: "50"

        click_button("Limit")

        expect(page).to have_content("Bob")
        expect(page).to_not have_content("Nancy Drew")
      end
    end
  end
end