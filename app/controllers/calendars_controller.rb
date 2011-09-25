class CalendarsController < ApplicationController
  
  def index
    @races = Race.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @races }
    end
  end

  def show
    @races = last_mounth
    
    render "#{params[:id]}"
 # render "pages/show/#{params[:id]}"
#    @race = Race.find(params[:id])

#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @race }
#    end
  end

  def last_mounth
    Race.all
  end
end

