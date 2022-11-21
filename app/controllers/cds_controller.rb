class CdsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cds = Cd.all
  end
end
