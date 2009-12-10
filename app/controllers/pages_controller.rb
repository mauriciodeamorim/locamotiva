class PagesController < ApplicationController
  
  def show
    render "pages/show/#{params[:id]}"
  end
end
