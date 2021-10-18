class OrchestrasController < ApplicationController
  def index
    @orchestras = Orchestra.all
  end

  def new
  end

  def create
    orchestra = Orchestra.new({
      name: params[:name],
      city: params[:city],
      hiring: params[:hiring],
      max_musicians: params[:max_musicians],
      created_at: Time.now,
      updated_at: Time.now
      })

    orchestra.save

    redirect_to '/orchestras'
  end

  def show
    @orchestra = Orchestra.find(params[:id])
  end

  def edit
    @orchestra = Orchestra.find(params[:id])
  end

  def update
    orchestra = Orchestra.find(params[:id])
    orchestra.update({
      name: params[:name],
      city: params[:city],
      hiring: params[:hiring],
      max_musicians: params[:max_musicians],
      updated_at: Time.now
      })

    orchestra.save
    redirect_to "/orchestras/#{orchestra.id}"
  end

  def destroy
    Orchestra.destroy(params[:id])
    redirect_to '/orchestras'
  end

  def musicians
    @orchestra = Orchestra.find(params[:id])
  end
end