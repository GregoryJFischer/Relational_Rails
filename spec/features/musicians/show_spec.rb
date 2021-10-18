require 'rails_helper'

RSpec.describe 'the musicians show page' do
  before :each do
    @orchestra = Orchestra.create!(name:          "New York Philharmonic",
                                   city:          "New York City",
                                   hiring:        true,
                                   max_musicians: 100)
    @musician_1 = Musician.create(name:         "Nancy Drew",
                                  hirable:      true,
                                  age:          22,
                                  orchestra_id: @orchestra.id)
    @musician_2 = Musician.create(name:         "Michael Scott",
                                  hirable:      false,
                                  age:          50,
                                  orchestra_id: @orchestra.id)
  end

  describe 'as a visitor' do
    describe 'when I visit the musicians index page' do
      it 'displays the musician name' do
        visit "/musicians/#{@musician_1.id}"
        expect(page).to have_content(@musician_1.name)

        visit "/musicians/#{@musician_2.id}"
        expect(page).to have_content(@musician_2.name)
      end

      it 'displays looking for work' do
        visit "/musicians/#{@musician_1.id}"
        expect(page).to have_content("Is looking for work: #{@musician_1.hirable}")

        visit "/musicians/#{@musician_2.id}"
        expect(page).to have_content("Is looking for work: #{@musician_2.hirable}")
      end

      it 'displays age' do
        visit "/musicians/#{@musician_1.id}"
        expect(page).to have_content("Age: #{@musician_1.age}")

        visit "/musicians/#{@musician_2.id}"
        expect(page).to have_content("Age: #{@musician_2.age}")
      end

      it 'can delete a musician' do
        visit "/musicians/#{@musician_1.id}"

        save_and_open_page
        click_button('Delete', match: :first)

        expect(current_path).to eq("/musicians")
        expect(current_path).to_not have_content(@musician_1.name)
      end

      it 'nav' do
        visit "/musicians/#{@musician_1.id}"

        expect(page).to have_link("Home")
        expect(page).to have_link("Orchestras")
        expect(page).to have_link("Musicians")
        expect(page).to have_link("Composers")
        expect(page).to have_link("Songs")
      end

      it 'delete' do
        visit "/musicians/#{@musician_1.id}"

        expect(page).to have_button("Delete")
      end
    end
  end
end