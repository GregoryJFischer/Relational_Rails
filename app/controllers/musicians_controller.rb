class MusiciansController < ApplicationController
  def index
  end

  def new
  end

  def create
    musician = Musician.new({
      orc_id: params[:musician][:orc_id],
      name: params[:musician][:name],
      hirable: params[:musician][:hirable],
      age: params[:musician][:age],
      created_at: time.now,
      updated_at: time.now
      })

    musician.save

    redirect_to '/musicians'
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def edit
    @musician = Musician.find(params[:id])
  end

  def update
    musician = Musician.find(params[:id])
    musician.update({
      orc_id: params[:musician][:orc_id],
      name: params[:musician][:name],
      hirable: params[:musician][:hirable],
      age: params[:musician][:age],
      created_at: time.now,
      updated_at: time.now
      })

    musician.save
    redirect_to "/musicians/#{musician.id}"
  end

  def destroy
    Musician.destroy(params[:id])
    redirect_to '/musicians'
  end
end