class ItemsController < ApplicationController

  before_action :authenticate_user!

  def create

    # @item = Item.new
    # @item.name = params[:item][:name]
    # @item.user = current_user

    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "Item saved!"     
    else
      flash[:error] = "Item not saved!"
    end

    redirect_to current_user

  end

  def destroy

    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item}\" was deleted successuflly."
    else
      flash[:error] = "There was an error deleting that item."
    end

    redirect_to current_user


  end

  private 

  def item_params
  	params.require(:item).permit(:name)
  end
end