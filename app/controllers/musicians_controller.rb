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
end