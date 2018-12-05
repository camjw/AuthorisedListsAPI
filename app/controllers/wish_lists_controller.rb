class WishListsController < ApplicationController
  before_action :set_wish_list, only: [:show, :update, :destroy]

  # GET /wish_lists
  def index
    @wish_lists = WishList.all
    json_response(@wish_lists)
  end

  # POST /wish_lists
  def create
    @wish_list = WishList.create!(wish_list_params)
    json_response(@wish_list, :created)
  end

  # GET /wish_lists/:id
  def show
    json_response(@wish_list)
  end

  # PUT /wish_lists/:id
  def update
    @wish_list.update(wish_list_params)
    head :no_content
  end

  # DELETE /wish_lists/:id
  def destroy
    @wish_list.destroy
    head :no_content
  end

  private

  def wish_list_params
    # whitelist params
    params.permit(:name, :user_id)
  end

  def set_wish_list
    @wish_list = WishList.find(params[:id])
  end
end
