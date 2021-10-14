require 'rails_helper'

RSpec.describe 'the orchestras show page' do
  before :each do
    @orchestra_1 = Orchestra.create!(name:          "New York Philharmonic",
                                     city:          "New York City",
                                     hiring:        true,
                                     max_musicians: 100)
    @orchestra_2 = Orchestra.create!(name:          "Boston Pops",
                                     city:          "Boston",
                                     hiring:        false,
                                     max_musicians: 120)
  end

  it 'displays the orchetra name' do
    visit "/orchestras/#{@orchestra_1.id}"
    expect(page).to have_content(@orchestra_1.name)

    visit "/orchestras/#{@orchestra_2.id}"
    expect(page).to have_content(@orchestra_2.name)
  end

  it 'displays location' do
    visit "/orchestras/#{@orchestra_1.id}"
    expect(page).to have_content("Location: #{@orchestra_1.city}")

    visit "/orchestras/#{@orchestra_2.id}"
    expect(page).to have_content("Location: #{@orchestra_2.city}")
  end

  it 'displays the max musicians' do
    visit "/orchestras/#{@orchestra_1.id}"
    expect(page).to have_content("Maximum Number of Musicians: #{@orchestra_1.max_musicians}")

    visit "/orchestras/#{@orchestra_2.id}"
    expect(page).to have_content("Maximum Number of Musicians: #{@orchestra_2.max_musicians}")
  end

  it 'displays hiring' do
    visit "/orchestras/#{@orchestra_1.id}"
    expect(page).to have_content("Is currently hiring: #{@orchestra_1.hiring}")

    visit "/orchestras/#{@orchestra_2.id}"
    expect(page).to have_content("Is currently hiring: #{@orchestra_2.hiring}")
  end
end