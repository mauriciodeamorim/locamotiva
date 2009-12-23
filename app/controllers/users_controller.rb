class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:create]
  before_filter :require_user, :only => [:new, :show, :edit, :update]
  
  def new  
      @user = User.new  
  end  

  def create  
    @user = User.new(params[:user])  
    if @user.save  
      flash[:notice] = "Registration successful."  
      redirect_to athletes_url  
    else  
      render :action => 'new'  
    end  
  end

  def edit  
    @user = current_user  
  end  

  def update  
    @user = current_user  
    if @user.update_attributes(params[:user])  
      flash[:notice] = "Successfully updated profile."  
      redirect_to races_url  
    else  
      render :action => 'edit'  
    end  
  end
end
