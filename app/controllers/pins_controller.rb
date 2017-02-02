class PinsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_pin, only: [:update, :destroy]
  def index
    pins = Pin.all
    render json: pins.to_json(include: :user), status: 200
  end

  def show
    pin = Pin.find_by(id: params[:id])
    if pin
      render json: pin, status: 200
    else
      render json: {error: "Pin Not found"}, status: 404
    end
  end

  def create
    pin = current_user.pins.build(pin_params)
    if pin.save
      render json: pin, status: 200
    else
      render json: pin.errors.full_messages, status: 422
    end
  end

  def update
    if @pin.update(pin_params)
      render json: @pin, status: 200
    else
      render json: @pin.errors.full_messages, status: 422
    end
  end

  def destroy
    if @pin
      @pin.destroy
      render json: @pin, status: 200
    else
      render json: { error: "Pin Not found" }, status: 422
    end
  end

  private
    def find_pin
      @pin = current_user.pins.find_by(id: params[:id])
    end

    def pin_params
      params.require(:pin).permit(:purchase, :item_name, :description, :user_id)
    end
end
