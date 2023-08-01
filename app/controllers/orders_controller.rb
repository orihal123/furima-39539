class OrdersController < ApplicationController

  
  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_address)
          .permit(:postal_code, :prefecture_id, :municipalities, :address_information, :building_name, :telephone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id])
  end
end




