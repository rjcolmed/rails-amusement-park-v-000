class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    alert = case
    when insufficient_tickets? && too_short?
      "Sorry." + insufficient_tickets_message + too_short_message
    when insufficient_tickets? 
      "Sorry." + insufficient_tickets_message
    when too_short?
      "Sorry." + too_short_message
    else 
      user.tap do |u|
        u.tickets -= attraction.tickets
        u.nausea += attraction.nausea_rating
        u.happiness += attraction.happiness_rating
      end.save

      "Thanks for riding the #{attraction.name}!"
    end
  end

  def insufficient_tickets?
    user.tickets < attraction.tickets
  end

  def too_short?
    user.height < attraction.min_height
  end

  def too_short_message
    " You are not tall enough to ride the #{attraction.name}."
  end

  def insufficient_tickets_message
    " You do not have enough tickets to ride the #{attraction.name}."
  end

end
