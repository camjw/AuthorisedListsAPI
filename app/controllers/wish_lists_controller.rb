# frozen_string_literal: true

# controller for wish lists
class WishListsController < ApplicationController
  before_action :set_wish_list, only: %i[show update destroy]

  # GET /users/:user_id/wish_lists
  # GET /wish_lists
  def index
    # get current user wish_lists
    @wish_lists = current_user.wish_lists
    json_response(@wish_lists)
  end

  # GET /wish_lists/:id
  def show
    json_response(@wish_list)
  end

  # POST /wish_lists
  def create
    # create wish_lists belonging to current user
    @wish_list = current_user.wish_lists.create!(wish_list_params)
    json_response(@wish_list, :created)
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

  # remove `created_by` from list of permitted parameters
  def wish_list_params
    params.permit(:name, :viewable)
  end

  def set_wish_list
    @wish_list = WishList.find(params[:id])
  end
end
