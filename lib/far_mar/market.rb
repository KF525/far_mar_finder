module FarMar
  class Market
    attr_accessor :id, :name, :address, :city, :county, :state, :zip

    def initialize(market_array)
      @id = market_array[0].to_i
      @name = market_array[1]
      @address = market_array[2]
      @cityv = market_array[3]
      @county = market_array[4]
      @state = market_array[5]
      @zip = market_array[6]
    end

    def self.all
      @all ||= all_create
    end

    def self.all_create
      market_data = CSV.read("support/markets.csv", "r")
      market_data.collect do |row|
        new(row)
      end
    end

    def self.find(id)
      all.find { |row| row.id == id }
    end

    def vendors
      Vendor.all.find_all { |row| row.market_id == id }
    end

    def vendor_id
      vendors.collect { |vendor| vendor.id }
    end

    def products
      vendor_id.collect do |an_id|
        Product.all.find_all { |row| row.vendor_id == an_id }
      end
    end

    def self.search(search_term)
      all.find_all { |a_market| a_market.name.include?(search_term) }
      #HELP! FarMar::Vendor.all.find_all {|a_vendor| a_vendor.name.include?(search_term)}
    end

    def vendor_sales
      vendor_id.collect do |an_id|
        FarMar::Sale.all.find_all { |row| row.vendor_id == an_id }
      end
    end

    def vendor_revenue
      vendor_revenue = {}

      vendor_sales.each do |vendor|
        total = 0
        vendor_id = nil
        vendor.each do |sale|
          total += sale.amount
          vendor_id = sale.vendor_id
        end
        vendor_revenue[vendor_id]= total
      end
      vendor_revenue
    end

    def prefered_vendor
      Vendor.all.find { |row | row.id == (vendor_revenue.sort_by{|k,v| v}.last.first) }
    end

    def worst_vendor
      Vendor.all.find { |row| row.id == (vendor_revenue.sort_by{|k,v| v}.first.first) }
    end
  end
end
