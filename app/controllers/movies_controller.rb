class MoviesController < ApplicationController
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
        @movie=Movie.find(params[:id])
    end

    def edit
        @movie=Movie.find(params[:id])
    end

    def update
        @movie=Movie.find(params[:id])
        @movie.update(movie_params)
        redirect_to movies_path
    end

    def destroy
        @movie=Movie.find(params[:id])
        @movie.destroy
        redirect_to movies_path
    end
    
    def favorite
        @movie=Movie.find(params[:id])
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
end
