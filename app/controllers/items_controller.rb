# frozen_string_literal: true

# app/controllers/items_controller.rb
class ItemsController < ApplicationController
  before_action :set_wish_list
  before_action :set_wish_list_item, only: %i[show update destroy]

  # GET /wish_lists/:wish_list_id/items
  def index
    json_response(@wish_list.items)
  end

  # GET /wish_lists/:wish_list_id/items/:id
  def show
    json_response(@item)
  end

  # POST /wish_lists/:wish_list_id/items
  def create
    @wish_list.items.create!(item_params)
    json_response(@wish_list, :created)
  end

  # PUT /wish_lists/:wish_list_id/items/:id
  def update
    @item.update(item_params)
    head :no_content
  end

  # DELETE /wish_lists/:wish_list_id/items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :bought, :original_price, :bid)
  end

  def set_wish_list
    @wish_list = WishList.find(params[:wish_list_id])
  end

  def set_wish_list_item
    @item = @wish_list.items.find_by!(id: params[:id]) if @wish_list
  end
end
