require 'spec_helper'

feature "user manages associations between cars and makes", %Q{
  As a car salesperson
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
} do

# Acceptance Criteria:

# When recording a car listing, I want to optionally associate it with its manufacturer.
# If I delete a manufacturer, the manufacturer and its primary key should
#   no longer be associated with any car listings.

  before :each do
    @make = FactoryGirl.create(:make)
    @prev_make_count = Make.count
  end

  scenario "Cars can optionally be associated with Makes" do
    prev_car_count = Car.count
    car = FactoryGirl.build(:car)
    visit new_car_path
    fill_in "Color", with: car.color
    select 1980, from: 'Year'
    fill_in "Mileage", with: car.mileage
    fill_in "Description", with: car.description
    select @make.name, from: 'Make'

    click_on "VRRRRROOOOOM!"

    expect(page).to have_content("Your car addition has gotten a 'GREEN LIGHT', AS IT WERE")
    expect(Car.count).to eq prev_car_count + 1
    expect(Car.last.make).to eql(@make)
  end

  scenario "A make is deleted from the database and removed from car listings without deleting cars" do
    car = FactoryGirl.create(:car, make: @make)
    expect(Car.last.make).to eql(@make)
    prev_car_count = Car.count
    visit makes_path
    click_on "Delete #{@make.name}"

    expect(page).to_not have_content(@make.name)
    expect(Make.count).to eq @prev_make_count - 1
    expect(Car.last.make).to eql(nil)
    expect(Car.count).to eq prev_car_count
  end
end
