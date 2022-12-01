class EmergenciesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @emergencies = Emergency.all
  end
end
