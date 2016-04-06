require 'spec_helper'

describe Movie do
  describe 'ratings presented' do
  	it 'should present all ratings' do
  		@m = Movie.create :title => "test", :rating => ["G", "PG", "PG-13", "NC-17", "R"]
  		Movie.all_ratings.should ==  @m.rating
  	end
  end
  describe 'searching similar directors' do
    it 'should call Movie with director' do
      @m=Movie.create :title => "test", :director => "test director"
      @m1 = Movie.same_director("test director")
      @m1[0].director.should == @m.director
    end
  end
end