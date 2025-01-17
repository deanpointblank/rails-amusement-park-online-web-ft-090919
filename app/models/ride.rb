class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride

        if !enough_tickets? && !tall_enough?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif !enough_tickets? || !tall_enough?
            if !enough_tickets?
                "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
            else
                "Sorry. You are not tall enough to ride the #{self.attraction.name}."
            end
        else
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
            "Thanks for riding the #{self.attraction.name}!"
        end

    end


    def enough_tickets?
        self.user.tickets > self.attraction.tickets
    end

    def tall_enough?
        self.user.height > self.attraction.min_height
    end


end
