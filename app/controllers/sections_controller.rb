class SectionsController < ApplicationController
#  layout false

	before_action :confirm_logged_in
	before_action :find_page

  def index
	@sections =  @page.sections.sorted	
  end

  def show
	@section = Section.find(params[:id])
  end

  def new
	@section = Section.new({:page_id => @page.id, :name => "Default"})
	@pages =  @page.subject.pages.sorted
	@section_count = Section.count + 1
  end
  
  def create
	# Instantiate a new object using form parameters
	@section = Section.new(section_params)
	# save the object
	if @section.save
		@page = @section.page
		# If save succeeds, redirect to index action
		flash[:notice] = "Section created successfully."
		@sections =  @page.sections.sorted			
		redirect_to(:action => 'index', :page_id => @page.id)
	else		
		# If save fails, redisplay the form so user can fix problems
		if @subject
			@pages =  @subject.pages.order('position ASC')		
			@section_count = @section.page.sections.count + 1
		end
		render('new')
	end
  end

  def edit
	@section = Section.find(params[:id])
	@pages =  @page.subject.pages.order('position ASC')
	#@pages = Page.order('position ASC')
	@section_count = @page.sections.count
  end
  
  def update
	
	# Find an existing object using form parameters
	@section = Section.find(params[:id])	
	# update the object
	if @section.update_attributes(section_params)
		# If update succeeds, redirect to index action
		flash[:notice] = "Section updated successfully."
		@page = @section.page
		@sections =  @page.sections.sorted
		redirect_to(:action => 'show', :id => @section.id, :page_id => @page.id)
	else
		# If update fails, redisplay the form so user can fix problems
		@pages =  @page.subject.pages.order('position ASC')
		#@pages = Page.order('position ASC')
		@section_count = @page.sections.count
		render('edit')
	end
  end

  def delete
	@section = Section.find(params[:id])
  end
  
  def destroy
	section = Section.find(params[:id]).destroy
	flash[:notice] = "Section '#{section.name}' destroyed successfully."
	redirect_to(:action => 'index', :page_id => @page.id)
  end
  
  private
  def section_params
	# same as using "params[:section]", except that it
	# - raises an error if :section is not present
	# - allows listed attributes to be mass assigned
	params.require(:section).permit(:page_id,:name,:position,:visible,:content_type,:content)
  end
  def find_page
	if params[:page_id]
		@page = Page.find(params[:page_id])
	end	
  end
end
