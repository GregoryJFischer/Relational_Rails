class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
  end

  def new
  end

  def create
    musician = Musician.new({
      orchestra_id: params[:musician][:orchestra_id],
      name: params[:musician][:name],
      hirable: params[:musician][:hirable],
      age: params[:musician][:age],
      created_at: Time.now,
      updated_at: Time.now
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
      orchestra_id: params[:musician][:orchestra_id],
      name: params[:musician][:name],
      hirable: params[:musician][:hirable],
      age: params[:musician][:age],
      updated_at: Time.now
      })

    musician.save
    redirect_to "/musicians/#{musician.id}"
  end

  def destroy
    Musician.destroy(params[:id])
    redirect_to '/musicians'
  end
end