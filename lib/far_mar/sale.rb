module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(sales_array)
      @id = sales_array[0].to_i
      @amount = sales_array[1].to_i
      @purchase_time = DateTime.parse(sales_array[2])
      @vendor_id = sales_array[3].to_i
      @product_id = sales_array[4].to_i
    end

    def self.all
      @all ||= all_create
    end

    def self.all_create
      sales_data = CSV.read("support/sales.csv", "r")

      sales_data.collect do |row|
        new(row)
      end
    end

    def self.find(id)
      all.find { |row| row.id == id }
    end

    def vendor
      Vendor.all.find { |row| row.id == vendor_id }
    end

    def product
      Product.all.find { |row| row.id == product_id }
    end

    def self.between(beginning_time, end_time)
      beginning_time = DateTime.parse(beginning_time)
      end_time = DateTime.parse(end_time)

      all.find_all { |row| row.purchase_time > beginning_time && row.purchase_time < end_time }
    end
  end
end
