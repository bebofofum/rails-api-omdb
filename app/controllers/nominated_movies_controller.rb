class NominatedMoviesController < ApplicationController
  before_action :set_nominated_movie, only: [:show, :update, :destroy]

  # GET /nominated_movies
  def index
    @nominated_movies = NominatedMovie.all

    render json: @nominated_movies
  end

  # GET /nominated_movies/1
  def show
    render json: @nominated_movie
  end

  # POST /nominated_movies
  def create
    @nominated_movie = NominatedMovie.new(nominated_movie_params)

    if @nominated_movie.save
      render json: @nominated_movie, status: :created, location: @nominated_movie
    else
      render json: @nominated_movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nominated_movies/1
  def update
    if @nominated_movie.update(nominated_movie_params)
      render json: @nominated_movie
    else
      render json: @nominated_movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nominated_movies/1
  def destroy
    @nominated_movie.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nominated_movie
      @nominated_movie = NominatedMovie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def nominated_movie_params
      params.require(:nominated_movie).permit(:name)
    end
end
