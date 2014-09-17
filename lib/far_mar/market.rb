module FarMar
  class Market
    attr_accessor :id, :name, :address, :city, :county, :state, :zip

    def initialize(market_array)
      @id = market_array[0].to_i
      @name = market_array[1]
      @address = market_array[2]
      @city = market_array[3]
      @county = market_array[4]
      @state = market_array[5]
      @zip = market_array[6]
    end

    def self.all
        market_data = CSV.read("support/markets.csv", "r")
        market_data.collect do |row|
          self.new(row)
        end
    end

    def self.find(id)
      self.all.find {|row| row.id == id}
    end

    def vendors
      Vendor.all.find_all {|row| row.market_id == self.id}
    end
  end
end
