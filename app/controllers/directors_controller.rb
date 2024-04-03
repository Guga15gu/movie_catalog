class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new( name: params[:director][:name],
                              nationality: params[:director][:nationality],
                              data_birth: params[:director][:data_birth],
                              favorite_genre_id: params[:director][:favorite_genre_id])

    if @director.save
      flash[:notice] = 'informações foram salvas com sucesso!'
      return redirect_to new_director_path
    end

    render :new
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])

    if @director.update(  name: params[:director][:name],
                          nationality: params[:director][:nationality],
                          data_birth: params[:director][:data_birth],
                          favorite_genre_id: params[:director][:favorite_genre_id])
      flash[:notice] = 'Gênero editado com sucesso!'

      return redirect_to director_path(@director.id)
    end

    render :edit
  end
end
