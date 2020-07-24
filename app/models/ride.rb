class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
  def take_ride
    flag = false
    if self.user.height && self.user.height < self.attraction.min_height
      self.errors.add(:base, "You are not tall enough to ride the #{self.attraction.name}")
      flag = true
    end
    if self.user.tickets && self.user.tickets < self.attraction.tickets
      self.errors.add(:base, "You do not have enough tickets to ride the #{self.attraction.name}")
      flag = true
    end
    return false if flag
    self.user.update(tickets: self.user.tickets - self.attraction.tickets, happiness: self.user.happiness + self.attraction.happiness_rating, nausea: self.user.nausea + self.attraction.nausea_rating)
    true
  end
end
