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
      Vendor.all.find_all {|row| row.market_id == id}
    end

    def vendor_id
      Vendor.all.find_all {|row| row.market_id == id}.collect {|vendor| vendor.id}
    end

    def products
      vendor_id.collect do |an_id|
        Product.all.find_all {|row| row.vendor_id == an_id }
      end
    end

    def self.search(search_term)
      self.all.find_all {|a_market| a_market.include?(search_term)}
      Vendor.all.find_all {|a_vendor| a_vendor.name.include?(search_term)}
    end

      #at a given market - vendor with most revenue
      #Sale.all.find_all {|row| row.vendor_id}
    def prefered_vendor
      total = 0
  
      vendors.collect do |a_vendor|
        a_vendor_sale = FarMar::Sale.all.find_all {|row| row.vendor_id == a_vendor.id}
          a_vendor_sale.collect do |sale|
          puts sale.amount
          puts total+= sale.amound
          puts total
            #needs to return vendor that has the most total
        end
      end
    end
  end
end
