class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  # add all the pages [] that we want to see without login 

  def home
  end
end
