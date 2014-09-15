module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :country, :state, :zip

    #This is a class/factory method, the factory is creating the instances
    def self.all
      CSV.read("support/markets.csv", "r")
    
    end

    def count
      self.all.count
    end

    def find(id)
    end
  end
end
