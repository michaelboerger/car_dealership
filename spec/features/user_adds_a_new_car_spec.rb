require 'spec_helper'

feature "user creates a new car", %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do


  # Acceptance Criteria:

  # I must specify the color, year, and mileage of the car.
  # Only years from 1980 and above can be specified.
  # I can optionally specify a description of the car.
  # If I enter all of the required information in the required formats, the car is recorded.
  # If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  # Upon successfully creating a car, I am redirected so that I can create another car.

  before :each do
    @car = FactoryGirl.build(:car)
    visit new_car_path
    @prev_count = Car.count
  end

  scenario "With valid attributes" do
    fill_in "Color", with: @car.color
    select 1980, from: 'Year'
    fill_in "Mileage", with: @car.mileage
    fill_in "Description", with: @car.description

    click_on "VRRRRROOOOOM!"

    expect(page).to have_content("Your car addition has gotten a 'GREEN LIGHT', AS IT WERE")
    expect(Car.count).to eq @prev_count + 1
  end

  scenario "Without valid attributes" do
    click_on "VRRRRROOOOOM!"

    expect(page).to have_content("*HONK SCREECH CRASH BOOM* CHECK YOUR BLIND SPOT YOU MADE MISTAKES")
    expect(Car.count).to eq @prev_count
  end
end
