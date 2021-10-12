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
end