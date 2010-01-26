class HpTesteController < ApplicationController
 
  def index
    @teste = HpTeste.abre
  end

#  def show
#    @race = Race.find(params[:id])
#    @results = Result.find_all_by_race_id(@race.id, :order => "class_general ASC")

#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @result }
#    end
#  end
end
