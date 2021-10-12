class SongsController < ApplicationController
  def index
  end

  def new
  end

  def create
    song = Song.new({
      composer_id: params[:song][:composer_id],
      name: params[:song][:name],
      public_domain: params[:song][:public_domain],
      year_composed: params[:song][:year_composed],
      created_at: time.now,
      updated_at: time.now
      })

    song.save

    redirect_to '/songs'
  end
end