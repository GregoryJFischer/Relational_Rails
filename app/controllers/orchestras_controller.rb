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
      created_at: Time.now,
      updated_at: Time.now
      })

    orchestra.save

    redirect_to '/orchestras'
  end
end