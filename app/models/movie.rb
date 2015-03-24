
class Movie < ActiveRecord::Base
	attr_accessible :title, :rating, :description, :release_date
  	@all_ratings = Array.new(['G','PG','PG-13','R'])
  	def self.ratings
    	return @all_ratings    
  	end
  
end
