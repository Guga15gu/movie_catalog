class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create

    if Genre.exists?(name: params[:genre][:name])
      flash[:notice] = 'Gênero já cadastrado!'
      return redirect_to new_genre_path
    end

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
    if Genre.exists?(name: params[:genre][:name])
      flash[:notice] = 'Gênero já cadastrado!'
      return redirect_to edit_genre_path
    end

    @genre = Genre.find(params[:id])

    if @genre.update( name: params[:genre][:name])
      flash[:notice] = 'Gênero editado com sucesso!'

      return redirect_to genre_path(@genre.id)
    end

    render :edit
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy

    redirect_to genres_index_path
  end

end
