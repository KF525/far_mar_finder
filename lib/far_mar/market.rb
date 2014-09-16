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
        @market_data = CSV.read("support/markets.csv", "r")
        @market_data.collect do |row|
          FarMar::Market.new(row)
        end
    end

    def self.find(id)
      self.all.find {|row| row.id == id}
    end

    def vendors(id)
      Vendor.all.find {|row| row.market_id == id}
    end
  end
end

#rspec spec/lib/far_mar/market_spec.rb
