module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :country, :state, :zip

    def initialize
      @market_data = CSV.read("/Users/katefulton/documents/ADA/week03/projects/far_mar_finder/support/markets.csv/far_mar_finder/support/markets.csv", "r")
    end

    def self.all
      
      puts @market_data.count
    end

    def self.find(id)
    end
  end
end
