class SessionsController < ApplicationController
  before_filter :authorize, :except => [:new, :create, :destroy]
  
  def new
  end
  
  def create
    user = User.authenticate(params[:login_name], params[:password])
    if user
      session[:user_id] = user.id
      uri = session[:original_uri]
      session[:original_uri] = nil
      
      redirect_to uri || root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid Login Name or Password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end
end
