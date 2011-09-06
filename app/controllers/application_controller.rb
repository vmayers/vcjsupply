class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :administrator_user
  helper_method :manufacturers
  helper_method :product_categories
  
  protected
    
    def authorize
      unless current_user
        session[:original_uri] = "http://" + request.host_with_port + request.fullpath
        flash[:notice] = "Please log in"
        redirect_to log_in_path
      end
    end
  
  private 
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def administrator_user
      if current_user
        current_user.administrator? 
      else
        false 
      end
    end
    
    def manufacturers
      Manufacturer.all
    end
    
    def product_categories
      ProductCategory.all
    end
end
