require 'spec_helper'

RSpec.describe MoviesHelper, type: :helper do
 describe "It can tell an even or odd number" do
    it "tells odd" do
      oddness(3).should ==  "odd"
    end
    it "tells even" do
      oddness(4).should ==  "even"
    end
  end
end
