module FarMar
  class Vendor
    attr_accessor :id, :name, :no_of_employees, :market_id

    def initialize(vendor_array)
      @id = vendor_array[0].to_i
      @name = vendor_array[1]
      @no_of_employees = vendor_array[2].to_i
      @market_id = vendor_array[3].to_i
    end

    def self.all
      vendor_data = CSV.read("support/vendors.csv", "r")

      vendor_data.collect do |row|
        self.new(row)
      end
    end

    def self.find(id)
      self.all.find {|row| row.id == id}
    end

    def self.by_market(market_id)
      self.all.find_all {|row| row.market_id == market_id}
    end

    def market
      Market.all.find {|row| row.id == market_id}
    end

    def sales
      Sale.all.find_all {|row| row.vendor_id == id}
    end

    def products
      Product.all.find_all {|row| row.vendor_id == id}
    end

  end
end
