class User
    attr_accessor :email, :age
    @@all_users = [] 

    def initialize(email, age) 
        @email = email
        @age = age
        @@all_users << self
    end

    def self.count
        return @@all_users.length
    end

    def self.all
        return @@all_users
    end

    def self.find_by_email(email)
        @@all_users.each do |user|

            if user.email == email
                return user
            end
        end

        puts "Aucun utilisateur n'a cet email"
        return false    
    end
end

puts "end of file"