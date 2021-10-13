class ComposersController < ApplicationController
  def index
    @composers = Composer.all
  end

  def new
  end

  def create
    composer = Composer.new({
      name: params[:composer][:name],
      nationality: params[:composer][:nationality],
      active: params[:composer][:active],
      total_songs: params[:composer][:total_songs],
      created_at: Time.now,
      updated_at: Time.now
      })

    composer.save

    redirect_to '/composers'
  end
end