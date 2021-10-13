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

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    song = Song.find(params[:id])
    song.update({
      composer_id: params[:song][:composer_id],
      name: params[:song][:name],
      public_domain: params[:song][:public_domain],
      year_composed: params[:song][:year_composed],
      created_at: Time.now,
      updated_at: Time.now
      })

    song.save
    redirect_to "/songs/#{song.id}"
  end

  def destroy
    Song.destroy(params[:id])
    redirect_to '/songs'
  end
end