class SongsController < ApplicationController
  def index
    if params[:order] == "true"
      @songs = Song.order_name.true?
    elsif params[:year] != nil
      @songs = Song.modern_check(params[:year])
    else
      @songs = Song.all.true?
    end
  end

  def new
  end

  def create
    song = Song.new({
      composer_id: params[:composer_id],
      name: params[:name],
      public_domain: params[:public_domain],
      year_composed: params[:year_composed],
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
      composer_id: params[:composer_id],
      name: params[:name],
      public_domain: params[:public_domain],
      year_composed: params[:year_composed],
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