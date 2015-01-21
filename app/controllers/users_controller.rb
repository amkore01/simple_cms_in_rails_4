class UsersController < ApplicationController

	before_action :confirm_logged_in

  def index
	@users =  User.sorted
  end

  def new
	@user =  User.new
  end
  
  def create
	# Instantiate a new object using form parameters
	@user =  User.new(user_params)
	# save the object
	if @user.save
		# If save succeeds, redirect to index action
		flash[:notice] = "User created successfully."
		redirect_to(:action => 'index')
	else
		# If save fails, redisplay the form so user can fix problems		
		render('new')
	end
  end

  def edit
	@user =  User.find(params[:id])
  end
  
  def update
	
	# Find an existing object using form parameters
	@user = User.find(params[:id])
	# update the object
	if @user.update_attributes(user_params)
		# If update succeeds, redirect to index action
		flash[:notice] = "User updated successfully."
		redirect_to(:action => 'index')
	else
		# If update fails, redisplay the form so user can fix problems		
		render('edit')
	end
  end

  def delete
	@user = User.find(params[:id])
  end
  
  def destroy
	user = User.find(params[:id]).destroy
	flash[:notice] = "User '#{user.name}' destroyed successfully."
	redirect_to(:action => 'index')
  end
  
  private
  def user_params
	# same as using "params[:user]", except that it
	# - raises an error if :user is not present
	# - allows listed attributes to be mass assigned
	params.require(:user).permit(:first_name,:last_name,:email,:password)
  end
end
