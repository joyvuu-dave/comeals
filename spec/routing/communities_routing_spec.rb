# == Schema Information
# Schema version: 20160218020330
#
# Table name: communities
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  cap             :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  rotation_length :integer
#
# Indexes
#
#  index_communities_on_name  (name) UNIQUE
#

require "rails_helper"

RSpec.describe CommunitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/communities").to route_to("communities#index")
    end

    it "routes to #new" do
      expect(:get => "/communities/new").to route_to("communities#new")
    end

    it "routes to #edit" do
      expect(:get => "/communities/1/edit").to route_to("communities#edit", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/communities/1").to route_to("communities#destroy", :id => "1")
    end

  end
end
