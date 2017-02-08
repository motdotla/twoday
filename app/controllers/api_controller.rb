class ApiController < ApplicationController
  def device_set_control
    @device = Device.find(params[:id])

    field = params[:field]
    value = params[:value]

    @device.send("#{field}=", value)

    if field.present? && value.present? && @device.save
      render json: { success: true }
    else
      render json: { success: false }, status: 400
    end
  end
end

