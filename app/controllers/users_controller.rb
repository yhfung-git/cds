class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
  end

 private

  def article_params
    params.require(:article).permit(:title, :body, :photo)
  end
end
