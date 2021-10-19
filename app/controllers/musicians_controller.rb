class MusiciansController < ApplicationController
  def index
    if params[:order] == "true"
      @musicians = Musician.order_name.true?
    else
      @musicians = Musician.all.true?
    end
  end

  def new
  end

  def create
    musician = Musician.new({
      orchestra_id: params[:orchestra_id],
      name: params[:name],
      hirable: params[:hirable],
      age: params[:age],
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
      orchestra_id: params[:orchestra_id],
      name: params[:name],
      hirable: params[:hirable],
      age: params[:age],
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