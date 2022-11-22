class CdsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_cd, only: %i[edit update destroy show]

  def home
    @cds = Cd.all
  end

  def index
    @cds = Cd.where(user_id: current_user.id)
  end

  def new
    @cd = Cd.new
  end

  def create
    @cd = Cd.new(cd_params)
    @cd.user = current_user
    if @cd.save!
      redirect_to cd_path(@cd)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @cd.update(cd_params)
    redirect_to cd_path(@cd)
  end

  def destroy
    @cd.destroy
    redirect_to root_path
  end

  def show
  end

  private

  def cd_params
    params.require(:cd).permit(:name, :description, :photo, :price)
  end

  def set_cd
    @cd = Cd.find(params[:id])
  end
end
