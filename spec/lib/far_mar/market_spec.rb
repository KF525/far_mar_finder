require 'spec_helper'
describe FarMar::Market do

  describe "class methods" do
    it "responds to 'all'" do
      expect(FarMar::Market).to respond_to :all
    end

    it "'all' should return" do
      expect(FarMar::Market.all.count).to eq 500
    end

    it "responds to 'find'" do
      expect(FarMar::Market).to respond_to :find
    end
  end

  describe "attributes" do
    let(:market) { FarMar::Market.find(1) }
    # 1,People's Co-op Farmers FarMar::Market,30,Portland,Multnomah,Oregon,97202

    it "has the id 1" do
      expect(market.id).to eq 1
    end

    it "has the name 'People's Co-op Farmers FarMar::Market'" do
      expect(market.name).to eq "People's Co-op Farmers Market"
    end

    it "has the address '30th and Burnside'" do
      expect(market.address).to eq "30th and Burnside"
    end

    it "has the city 'Portland'" do
      expect(market.city).to eq "Portland"
    end
    it "has the county 'Multnomah'" do
      expect(market.county).to eq "Multnomah"
    end
    it "has the state 'Oregon'" do
      expect(market.state).to eq "Oregon"
    end
    it "has the zip '97202'" do
      expect(market.zip).to eq "97202"
    end
  end

  describe "instance methods" do
    let(:market) { FarMar::Market.find(1) }
    it "responds to vendors" do
      expect(FarMar::Market.new({})).to respond_to :vendors
    end

    it "finds the vendors" do
      expect(market.vendors.first.id).to eq 1
    end
  end

  describe "find products" do
    let(:market) {FarMar::Market.find(1)}
    it "responds to market products" do
      expect(FarMar::Market.new({})).to respond_to :products
    end

    it "finds the market product sales" do
      expect(market.products.first.id).to eq 1
    end
  end

  describe "finds prefered vendor" do
    let(:market) {FarMar::Market.find(1)}
    it "responds to prefered vendor" do
      expect(FarMar::Market.new({})).to respond_to :prefered_vendor
    end

    it "finds prefered vendor" do
      expect(market.prefered_vendor.id).to eq 5
    end
  end

  describe "finds worst vendor" do
    let(:market) {FarMar::Market.find(1)}
    it "responds to worst vendor" do
      expect(FarMar::Market.new({})).to respond_to :worst_vendor
    end

    it "finds worst vendor" do
      expect(market.worst_vendor.id).to eq 6
    end
  end
end
