class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
  end


  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
  
end
