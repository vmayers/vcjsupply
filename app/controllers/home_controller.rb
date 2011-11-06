class HomeController < ApplicationController
  before_filter :authorize, :except => [:index]
  def index
    @blogs = Blog.order("created_at").paginate(:per_page => 10, :page => params[:page])
    
  end
end
