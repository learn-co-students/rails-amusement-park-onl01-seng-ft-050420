require 'rails_helper'

RSpec.describe Ride, :type => :model do
  let(:attraction) {
    Attraction.create(
      :name => "Roller Coaster",
      :tickets => 5,
      :nausea_rating => 2,
      :happiness_rating => 4,
      :min_height => 32
    )
  }

  let(:user) {
    User.create(
      :name => "Mindy",
      :password => "password",
      :nausea => 5,
      :happiness => 3,
      :tickets => 4,
      :height => 34
    )
  }

  let(:ride) {
    Ride.create(user_id: user.id, attraction_id: attraction.id)
  }



  it "belongs to one attraction" do
    expect(ride.attraction).to eq(attraction)
  end

  it "belongs to one user" do
    expect(ride.user).to eq(user)
  end

  it "has a method 'take_ride' that updates ticket number" do
    user.update(:tickets => 10)
    ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
    ride.take_ride
    mindy = User.find_by(:name => "Mindy")
    expect(mindy.tickets).to eq(5)
  end

  it "has a method 'take_ride' that updates the user's nausea" do
    user.update(:tickets => 10)
    ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
    ride.take_ride
    mindy = User.find_by(:name => "Mindy")
    expect(mindy.nausea).to eq(7)
  end

  it "has a method 'take_ride' that updates the user's happiness" do
    user.update(:tickets => 10)
    ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
    ride.take_ride
    mindy = User.find_by(:name => "Mindy")
    expect(mindy.happiness).to eq(7)
  end
end
