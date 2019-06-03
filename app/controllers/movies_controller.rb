class MoviesController < ApplicationController
    before_action :find_movie, only: [:show, :edit, :update, :destroy, :favorite]
    def index
        @movies=Movie.all
    end
    
    def new
        @movie=Movie.new
    end

    def create
        @movie=Movie.new(movie_params)
        @movie.save
        redirect_to movies_path
    end

    def show
    end

    def edit
    end

    def update
        @movie.update(movie_params)
        redirect_to movies_path
    end

    def destroy
        @movie.destroy
        redirect_to movies_path
    end
    
    def favorite
        
        if @movie.favorite == true
        @movie.favorite = false
        elsif @movie.favorite == false
        @movie.favorite = true
        end
        @movie.save
        redirect_to movies_path
    end

    private

    def movie_params    
        params.require(:movie).permit(:title, :year, :favorite)
    end

    def find_movie
        @movie=Movie.find(params[:id])
    end
end
