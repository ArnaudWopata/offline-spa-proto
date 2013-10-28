class Api::V1::ItemsController < Api::V1::BaseController

  def index
    @items = Item.all
    p "Items #{@items}"
  end

  def show
    p "Item id = #{params[:id]}"
    @item = Item.find(params[:id])
  end
end
