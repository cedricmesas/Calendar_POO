require "time"
require "pry"

class Event
    attr_accessor :start_date, :duration, :title, :attendees

    def initialize(start_date, duration, title, attendees)
        @start_date = Time.parse(start_date)
        @duration = duration
        @title = title
        @attendees = attendees #invités
    end

    def postpone_24h
        @start_date += 24 * 60 * 60
    end

    def end_date
        @start_date + @duration*60
    end

    def is_past?
        @start_date < Time.now
    end 

    def is_future?
        !self.is_past?
    end

    def is_soon?
        @start_date < Time.now + 30*60 
    end

    def age_analysis 
        age_array = []
        average = 0

        @attendees.each do |attendee| 
            age_array << attendee.age
            average += attendee.age
        end

        average = average / @attendees.lenght #moyenne = le résultat de l'addition des âges / par le nombres de participants. 

        puts "Voici les âges des participants :"
        puts age_array.join(", ")
        puts "La moyenne d'âge est de #{average} ans."
    end

    def to_s 
        puts "> Titre : #{title}"
        puts "> Date de début : #{start_date}"
        puts "> Durée : #{duration} minutes"
        print "> Invités : "
        puts @attendees.join(", ")
    end
end

class WorkEvent < Event
    attr_accessor :location
    
    def initialize(start_date, duration, title, attendees, location)
        @location = location

        super(start_date, duration, title, attendees) #appel à l'initialize de la classe event
    end

    def is_event_acceptable?

        if attendees.size > 3 || @duration > 60
            puts "Cette réunion ne respecte pas les bonnes pratiques"
            return false
        else  
            puts "Cette réunion est parfaite <3"
            return true
        end
    end
end

#class CalendarDisplayer
#end

puts "end of file"