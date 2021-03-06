# == Schema Information
# Schema version: 20160202150722
#
# Table name: units
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_units_on_name  (name) UNIQUE
#

require "rails_helper"

RSpec.describe UnitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/units").to route_to("units#index")
    end

    it "routes to #new" do
      expect(:get => "/units/new").to route_to("units#new")
    end

    it "routes to #edit" do
      expect(:get => "/units/1/edit").to route_to("units#edit", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/units/1").to route_to("units#destroy", :id => "1")
    end

  end
end
