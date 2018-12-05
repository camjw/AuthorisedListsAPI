# frozen_string_literal: true

# controller for wish lists
class WishListsController < ApplicationController
  before_action :set_user
  before_action :set_user_wish_list, only: %i[show update destroy]

  # GET /users/:user_id/wish_lists
  def index
    json_response(@user.wish_lists)
  end

  # GET /users/:user_id/wish_lists/:id
  def show
    json_response(@wish_list)
  end

  # POST /users/:user_id/wish_lists
  def create
    @user.wish_lists.create!(wish_list_params)
    json_response(@user, :created)
  end

  # PUT /users/:user_id/wish_lists/:id
  def update
    @wish_list.update(wish_list_params)
    head :no_content
  end

  # DELETE /users/:user_id/wish_lists/:id
  def destroy
    @wish_list.destroy
    head :no_content
  end

  private

  def wish_list_params
    params.permit(:name, :viewable)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_wish_list
    @wish_list = @user.wish_lists.find_by!(id: params[:id]) if @user
  end
end
