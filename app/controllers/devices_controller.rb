class DevicesController < ApplicationController
  def index
    @devices = Device.all
  end

  def show
    @device = Device.find(params[:id])
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])

    if @device.update(device_params)
      redirect_to devices_path
    else
      render 'edit'
    end
  end

  private

  def device_params
    params.require(:device).permit!
  end
end
