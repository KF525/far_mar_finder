module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :country, :state, :zip

    def initialize(market_array)
      @id = market_array[0]
      # @name = market_array[1]
      # @address = market_array[2]
      # @city = market_array[3]
      # @country = market_array[4]
      # @state = market_array[5]
      # @zip = market_array[6]
    end

    def self.all
        @market_data = CSV.read("support/markets.csv", "r")
        @market_data.collect do |row|
          market = FarMar::Market.new(row)
        #  market.inspect
        end

    end

    def count
      self.all.count
    end

    def self.find(id)
      self.all.find{|num| num[0].to_i == id.to_i}

    end

  end
end
