class RacesController < ApplicationController

  def index
    @races = Race.find(:all, :order => 'date DESC')
  end
end
