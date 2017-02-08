class ApiController < ApplicationController
  def device_set_control
    @device = Device.find(params[:id])

    service = DeviceSetControl.new(@device, params[:field], params[:value])

    result = service.run

    if result.success?
      render json: { success: true }
    else
      render json: { success: false, error: result.error }, status: 400
    end
  end
end

