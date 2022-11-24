class CdsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show]
  before_action :set_cd, only: %i[edit update destroy show]

  def home
    #@cds = Cd.all
    if params[:query]
      @cds = Cd.search_by_name_and_description(params[:query])
    else
      #@cds = Cd.all
      @cds = Cd.all unless Cd @booking.cd = Cd.find(params[:cd_id])
    end
  end

  def index
    @cds = Cd.where(user_id: current_user.id)
    authorize @cds
  end

  def new
    @cd = Cd.new
    authorize @cd
  end

  def create
    @cd = Cd.new(cd_params)
    @cd.user = current_user
    authorize @cd
    if @cd.save
      redirect_to cd_path(@cd)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @cd
  end

  def update
    @cd.update(cd_params)
    authorize @cd
    redirect_to cd_path(@cd)
  end

  def destroy
    @cd.destroy
    authorize @cd
    redirect_to root_path
  end

  def show
    authorize @cd
  end

  private

  def cd_params
    params.require(:cd).permit(:name, :description, :photo, :price)
  end

  def set_cd
    @cd = Cd.find(params[:id])
  end
end
