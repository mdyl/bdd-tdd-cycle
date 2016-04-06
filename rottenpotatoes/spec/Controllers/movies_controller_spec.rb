require 'spec_helper'

RSpec.describe MoviesController, type: :controller do
  # log in a user

  describe "It renders the templates" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
    it "renders the edit template" do
      { :get => edit_movie_path(1) }.
        should route_to(:controller => "movies", :action => "edit", :id => "1")
    end
    it "renders the show template" do
      { :get => movie_path(1) }.
        should route_to(:controller => "movies", :action => "show", :id => "1")
    end
    it "renders the same template" do
      { :get => movie_same_path(1) }.
        should route_to(:controller => "movies", :action => "same", :movie_id => "1")
    end
    it "renders the index template" do
      { :get => movies_path }.
        should route_to(:controller => "movies", :action => "index")
    end
  end
  describe "It edits and creates correctly" do
    it 'should edit a movie' do
      @m=Movie.create :title => "test", :id => "1000"
      get :edit, id: @m
      assigns(:movie).should == @m
    end
    it 'should update a movie' do
      @m=Movie.create :title => "test1", :description => "testing", :director => "test director"
      get :update, id: @m
      assigns(:movie).should == @m
    end
    it 'should show a simliar movie director movie' do
      @m=Movie.create :title => "test", :description => "testing", :director => "test director"
      @m1=Movie.create :title => "test1", :description => "testing1", :director => "test director"
      get :same, movie_id: @m1
      assigns(:movie).director.should == @m.director
    end
    it 'should create a movie' do
      @m=Movie.create :title => "test", :id => "1000"
      get :create, id: @m
      assigns(:movie).id.should == 2
    end
    it 'should show a movie' do
      @m=Movie.create :title => "test1", :description => "testing", :director => "test director", :id => "1"
      get :show, :id => 1
    end
    it 'should delete a movie' do
       @m=Movie.create :title => "test1", :description => "testing", :director => "test director" , :id => "1"

       delete :destroy, :id => 1
    end
    it 'should display all movies' do
    	get :index 
    end
    it 'should display only PG movies' do
    	session[:rating] = ['PG']
    	get :index, :rating => session[:rating]
    end

  end
end
