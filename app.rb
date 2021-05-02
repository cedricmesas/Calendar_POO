require 'bundler'
Bundler.require

require_relative 'lib/user'
require_relative 'lib/event'


class EventCreator
    @@all = []

    def initialize
        puts "Go pour la création d'un évènement."
        @title_event = title_event
        @time_duration = time_duration
        @moment = moment
        @participant = participant
        new_event = Event.new(@title_event, @time_duration, @moment, @participant)
        @@all << new_event
    end

    def title_event
        puts "Quel est le nom de l'événement ?"
        print "> "
        gets.chomp
    end

    def time_duration
        puts "Super. Quand aura-t-il lieu ?"
        print "> "
        gets.chomp
    end

    def moment
        puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
        print "> "
        gets.chomp
    end

    def participant
        puts "Génial. Qui va participer ? Balance leurs e-mails"
        print "> "
        gets.chomp.split(';')
    end

    def self.all_events
        @all.each do |i|
            i.to_s
            puts
        end
    end
      
end