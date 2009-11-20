class AthletesController < ApplicationController

  def index
    @athletes = Athlete.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @athletes }
    end
  end
end
