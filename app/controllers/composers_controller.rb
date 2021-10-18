class ComposersController < ApplicationController
  def index
    @composers = Composer.all
  end

  def new
  end

  def create
    composer = Composer.new({
      name: params[:name],
      nationality: params[:nationality],
      active: params[:active],
      total_songs: params[:total_songs],
      created_at: Time.now,
      updated_at: Time.now
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
      name: params[:name],
      nationality: params[:nationality],
      active: params[:active],
      total_songs: params[:total_songs],
      updated_at: Time.now
      })

    composer.save
    redirect_to "/composers/#{composer.id}"
  end

  def destroy
    Composer.destroy(params[:id])
    redirect_to '/composers'
  end

  def songs
    @composer = Composer.find(params[:id])
  end
end