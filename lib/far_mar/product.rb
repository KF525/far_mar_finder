module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id

    def initialize(product_array)
      @id = product_array[0].to_i
      @name = product_array[1]
      @vendor_id = product_array[2].to_i
    end

    def self.all
      product_data = CSV.read("support/products.csv", "r")

      product_data.collect do |row|
        self.new(row)
      end
    end

    def self.find(id)
      self.all.find {|row| row.id == id}
    end

    def self.by_vendor(vendor_id)
      self.all.find_all {|row| row.vendor_id == vendor_id}

    end

    def vendor
      #puts Vendor.all
      Vendor.all.find {|row| row.id == vendor_id} # doesn't work with find_all
    end

    def sales
      Sale.all.find_all {|row| row.product_id == id} ## fix later!
    end

    def number_of_sales
      sales.count #?
    end


  end
end
