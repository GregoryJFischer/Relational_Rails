class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
  end

  def new
  end

  def create
    musician = Musician.new({
      orc_id: params[:musician][:orc_id],
      name: params[:musician][:name],
      hirable: params[:musician][:hirable],
      age: params[:musician][:age],
      created_at: Time.now,
      updated_at: Time.now
      })

    musician.save

    redirect_to '/musicians'
  end
end