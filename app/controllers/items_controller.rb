# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[show update destroy]

  # GET /items
  def index
    @items = Item.all
    json_response(@items)
  end

  # POST /items
  def create
    @item = Item.create!(item_params)
    json_response(@item, :created)
  end

  # GET /items/:id
  def show
    json_response(@item)
  end

  # PUT /items/:id
  def update
    @item.update(item_params)
    head :no_content
  end

  # DELETE /items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    # whitelist params
    params.permit(:name)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
