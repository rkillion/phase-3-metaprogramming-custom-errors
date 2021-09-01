require "pry"

class Person
  attr_accessor :partner, :name
  @@all = []

  def initialize(name)
    @name = name
    @@all<<self
  end

  def self.all
    @@all
  end

  def self.get_by_name(name)
    self.all.find{|p|p.name==name}
  end

  def get_married(person)
    if person.is_a?(Person)
      person.partner = self
      self.partner = person
    else
      begin
        raise PartnerError
      rescue PartnerError => error
        puts error.message
        # input = error.message(person)
        # if input=="y"
        #   new_partner = Person.new(person)
        #   self.partner = new_partner
        #   new_partner.partner = self
        #   puts "#{self.name} and #{new_partner.name} have been married!"
        # else
        #   puts "Marriage cancelled."
        # end
      end
    end
  end

  class PartnerError < StandardError
    def message #(person)
      "you must give the get_married method an argument of an instance of the person class!"
      # print "Would you like to make #{person} a Person? y/n: "
      # input = gets.chomp
      # input
    end
  end

end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name

binding.pry


