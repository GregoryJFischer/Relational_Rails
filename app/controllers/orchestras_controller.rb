class OrchestrasController < ApplicationController
  def index
  end

  def new
  end

  def create
    orchestra = Orchestra.new({
      name: params[:orchestra][:name],
      city: params[:orchestra][:city],
      hiring: params[:orchestra][:hiring],
      max_musicians: params[:orchestra][:max_musicians],
      created_at: time.now,
      updated_at: time.now
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
    orchestra = Orchetra.find(params[:id])
    orchestra.update({
      name: params[:orchestra][:name],
      city: params[:orchestra][:city],
      hiring: params[:orchestra][:hiring],
      max_musicians: params[:orchestra][:max_musicians],
      created_at: time.now,
      updated_at: time.now
      })

    orchestra.save
    redirect_to "/orchestras/#{orchestra.id}"
  end
end