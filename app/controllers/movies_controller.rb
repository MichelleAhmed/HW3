# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def initialize
	@all_ratings = Movie.all_ratings
	super  
  end
  def index
    #all_ratings = Movie.ratings
    if params[:ratings]
	@ratings_filter = params[:ratings].keys
	puts "inside else" +ratings_filter.inspect
	pits "inside else" + (params[:sort_key]).find_all_by_rating(@ratings_filter)
    else
	@movies = Movie.order(params[:sort_key]).find_all
    end		
   
		
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # Look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
