class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(name: params[:genre][:name])

    if @genre.save
      flash[:notice] = 'informações foram salvas com sucesso!'
      return redirect_to new_genre_path
    end

    render :new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update( name: params[:genre][:name])
      flash[:notice] = 'Gênero editado com sucesso!'

      return redirect_to genre_path(@genre.id)
    end

    render :edit
  end

end
