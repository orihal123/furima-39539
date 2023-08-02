class OrdersController < ApplicationController
before_action :authenticate_user!, only: [:index, :create]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  
    if user_signed_in?
      # 自身が出品している商品かどうかを判定
      if @item.user == current_user
        redirect_to root_path, alert: '自身が出品した商品は購入できません。'
      elsif @item.order.present?
        redirect_to root_path, alert: '売却済みの商品は購入できません。'
      end
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])

    if @order_address.valid?
      pay_item
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
          .merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end




