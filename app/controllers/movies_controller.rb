class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new( title: params[:movie][:title],
                        year: params[:movie][:year],
                        summary: params[:movie][:summary],
                        country: params[:movie][:country],
                        duration: params[:movie][:duration],
                        director_id: params[:movie][:director_id],
                        genre_id: params[:movie][:genre_id])

    if @movie.save
      flash[:notice] = 'informações foram salvas com sucesso!'
      return redirect_to new_movie_path
    end

    render :new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update( title: params[:movie][:title],
                      year: params[:movie][:year],
                      summary: params[:movie][:summary],
                      country: params[:movie][:country],
                      duration: params[:movie][:duration],
                      director_id: params[:movie][:director_id],
                      genre_id: params[:movie][:genre_id])
      flash[:notice] = 'Filme editado com sucesso!'

      return redirect_to movie_path(@movie.id)
    end

    render :edit
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy

    redirect_to movies_index_path
  end
end
