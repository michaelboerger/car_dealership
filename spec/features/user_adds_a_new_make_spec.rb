require 'spec_helper'

feature "user adds a new make", %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

  # Acceptance Criteria:

  # I must specify a manufacturer name and country.
  # If I do not specify the required information, I am presented with errors.
  # If I specify the required information, the manufacturer is recorded
  #   and I am redirected to enter another new manufacturer.

  before :each do
    @make = FactoryGirl.build(:make)
    visit new_make_path
    @prev_count = Make.count
  end

  scenario "With valid attributes" do
    fill_in "Name", with: @make.name
    fill_in "Country", with: @make.country

    click_on "I knew to make this button to make it so you could make a make"

    expect(page).to have_content("MAKE MADE! MAKE MORE!")
    expect(Make.count).to eq @prev_count + 1
  end

  scenario "Without valid attributes" do
    click_on "I knew to make this button to make it so you could make a make"

    expect(page).to have_content("Practice your form form and try again!")
    expect(Make.count).to eq @prev_count
  end
end
