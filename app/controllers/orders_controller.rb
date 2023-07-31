class OrdersController < ApplicationController


  def index
    # @item = Item.find(params[:item_id])
   
    # indexアクションの処理を記述
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def order_params
  params.require(:order).permit(:user_id, :item_id, :postal_code, :prefecture_id, :municipalities,
                                :address_information, :building_name, :telephone_number)
        .merge(user_id: current_user.id)
end


end
