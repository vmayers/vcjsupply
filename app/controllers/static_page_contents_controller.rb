class StaticPageContentsController < ApplicationController
  # GET /static_page_contents
  # GET /static_page_contents.xml
  
  uses_tiny_mce
  
  # def index
  #     @static_page_contents = StaticPageContent.all
  # 
  #     respond_to do |format|
  #       format.html # index.html.erb
  #       format.xml  { render :xml => @static_page_contents }
  #     end
  #   end

  # GET /static_page_contents/1
  # GET /static_page_contents/1.xml
  def show_about
    @content = StaticPageContent.first
    @static_page_content = StaticPageContent.find(@content.id)

    respond_to do |format|
      format.html # show_about.html.erb
      format.xml  { render :xml => @static_page_content }
    end
  end
  
  def show_contact
    @content = StaticPageContent.first
    @static_page_content = StaticPageContent.find(@content.id)

    respond_to do |format|
      format.html # show_contact.html.erb
      format.xml  { render :xml => @static_page_content }
    end
  end

  # GET /static_page_contents/new
  # GET /static_page_contents/new.xml
  # def new
  #    @static_page_content = StaticPageContent.new
  # 
  #    respond_to do |format|
  #      format.html # new.html.erb
  #      format.xml  { render :xml => @static_page_content }
  #    end
  #  end

  # GET /static_page_contents/1/edit
  def edit_contact
    @content = StaticPageContent.first
    @static_page_content = StaticPageContent.find(@content.id)
  end
  
  def edit_about
    @content = StaticPageContent.first
    @static_page_content = StaticPageContent.find(@content.id)
  end

  # POST /static_page_contents
  # POST /static_page_contents.xml
  # def create
  #     @static_page_content = StaticPageContent.new(params[:static_page_content])
  # 
  #     respond_to do |format|
  #       if @static_page_content.save
  #         format.html { redirect_to(@static_page_content, :notice => 'Static page content was successfully created.') }
  #         format.xml  { render :xml => @static_page_content, :status => :created, :location => @static_page_content }
  #       else
  #         format.html { render :action => "new" }
  #         format.xml  { render :xml => @static_page_content.errors, :status => :unprocessable_entity }
  #       end
  #     end
  #   end

  # PUT /static_page_contents/1
  # PUT /static_page_contents/1.xml
  def update
    @static_page_content = StaticPageContent.find(params[:id])

    respond_to do |format|
      if @static_page_content.update_attributes(params[:static_page_content])
        format.html { redirect_to(administration_index_path, :notice => 'Static page content was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @static_page_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /static_page_contents/1
  # DELETE /static_page_contents/1.xml
  # def destroy
  #     @static_page_content = StaticPageContent.find(params[:id])
  #     @static_page_content.destroy
  # 
  #     respond_to do |format|
  #       format.html { redirect_to(static_page_contents_url) }
  #       format.xml  { head :ok }
  #     end
  #   end
end
