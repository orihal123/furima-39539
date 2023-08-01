class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :check_owner, only: [:edit, :update, :destroy]


  def index
    @items = Item.order('created_at DESC')
    
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find_by(item_id: @item.id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  
 


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def check_owner
    redirect_to root_path unless @item.user == current_user
  end

  def item_params
    params
      .require(:item)
      .permit(:item_name, :category_id, :condition_id, :content, :image,
              :shipping_fee_burden_id, :prefecture_id, :shipping_duration_id, :price)
      .merge(user_id: current_user.id)
  end
end
