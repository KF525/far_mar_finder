module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id

    def initialize(product_array)
      @id = product_array[0].to_i
      @name = product_array[1]
      @vendor_id = product_array[2].to_i
    end

    def self.all
      @all ||= all_create
    end

    def self.all_create
      product_data = CSV.read("support/products.csv", "r")

      product_data.collect do |row|
        new(row)
      end
    end

    def self.find(id)
      all.find { |row| row.id == id}
    end

    def self.by_vendor(vendor_id)
      all.find_all { |row| row.vendor_id == vendor_id }
    end

    def vendor
      Vendor.all.find { |row| row.id == vendor_id }
    end

    def sales
      Sale.all.find_all { |row| row.product_id == id }
    end

    def number_of_sales
      sales.count
    end
  end
end
