class ComposersController < ApplicationController
  def index
  end

  def new
  end

  def create
    composer = Composer.new({
      name: params[:composer][:name],
      nationality: params[:composer][:nationality],
      active: params[:composer][:active],
      total_songs: params[:composer][:total_songs],
      created_at: time.now,
      updated_at: time.now
      })

    composer.save

    redirect_to '/composers'
  end

  def show
    @composer = Composer.find(params[:id])
  end

  def edit
    @composer = Composer.find(params[:id])
  end

  def update
    composer = Composer.find(params[:id])
    composer.update({
      name: params[:composer][:name],
      nationality: params[:composer][:nationality],
      active: params[:composer][:active],
      total_songs: params[:composer][:total_songs],
      created_at: time.now,
      updated_at: time.now
      })

    composer.save
    redirect_to "/coposers/#{composer.id}"
  end

  def destroy
    Composer.destroy(params[:id])
    redirect_to '/composers'
  end
end