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
      sales_data = CSV.read("support/sales.csv", "r")

      sales_data.collect do |row|
        self.new(row)
      end
    end

    def self.find(id)
      self.all.find {|row| row.id == id}
    end

    # def self.between(beginning_time, end_time)
    # end

    def vendor
      Vendor.all.find {|row| row.id == vendor_id}
    end

    def product
      Product.all.find {|row| row.id == product_id}
    end
  end
end
