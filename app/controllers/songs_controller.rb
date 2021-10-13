class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
  end

  def create
    song = Song.new({
      composer_id: params[:song][:composer_id],
      name: params[:song][:name],
      public_domain: params[:song][:public_domain],
      year_composed: params[:song][:year_composed],
      created_at: Time.now,
      updated_at: Time.now
      })

    song.save

    redirect_to '/songs'
  end
end