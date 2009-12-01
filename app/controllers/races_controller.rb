class RacesController < ApplicationController

  def index
    @races = Race.paginate(:all, :order => 'date DESC', :per_page => 3, :page => params[:page])
  end
end
