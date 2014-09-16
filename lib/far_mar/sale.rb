module FarMar
  class Sale
    attr_accessor :ID, :Amount, :Purchase_Time, :Vendor_ID, :Product_ID

    def initialize(sales_array)
      @ID = sales_array[0]
      @Amount = sales_array[1]
      @Purchase_Time = sales_array[2]
      @Vendor_ID = sales_array[3]
      @Product_ID = sales_array[4]
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


  end
end
