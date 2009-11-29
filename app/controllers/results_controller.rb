class ResultsController < ApplicationController
 
  def index
    @last_race = Result.last_race
    @results = Result.by_race
  end

  def show
    @race = Race.find(params[:id])
    @results = Result.find_all_by_race_id(@race.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @result }
    end
  end
end
