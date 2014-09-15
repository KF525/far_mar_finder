module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :country, :state, :zip

    def initialize
      @market_data = CSV.read("support/markets.csv", "r")

    end

    def self.all

      puts @market_data
    end

    def self.find(id)
    end
  end
end
