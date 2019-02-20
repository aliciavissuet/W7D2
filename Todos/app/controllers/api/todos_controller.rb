class Api::TodosController < ApplicationController
  def show
    render json: Item.find(params[:id])
  end

  def index 
    render json: Item.all
  end

  def create 
    @item = Item.new(todos_params)
    if @item.save 
      render json: @item
    else
      render json: @item.errors.full_messages, status: 422
    end
  end

  def update 
    @item = Item.find(params[:id])
    if @item.update_attributes(todos_params)
      render json: @item
    else
      render json: @item.errors.full_messages, status: 400
    end
  end

  def destroy  
    @item = Item.find(params[:id])
    @item.delete
    render json: Item.all
  end

  def todos_params
    params.require(:item).permit(:title, :body, :done)
  end

end
