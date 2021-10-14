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
end