class AccessController < ApplicationController

	before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
	# display text & links
  end

  def login
	# login form
  end
  
  def attempt_login
	# display text & links
	
	if params[:email].present? && params[:password].present?
		found_user = User.where(:email => params[:email]).first
		if found_user
			authorized_user = found_user.authenticate(params[:password])
		end
	end
	
	if authorized_user
		# mark user as logged in
		session[:used_id] = authorized_user.id
		session[:email] = authorized_user.email
		flash[:notice] = "You are now logged in"
		redirect_to(:action => 'index')
	else
		# mark user as logged in
		flash[:notice] = "Invalid username/password combination"
		redirect_to(:action => 'login')
	end
	
  end

  def logout
	# mark user as logged out
		session[:used_id] = nil
		session[:email] = nil
		flash[:notice] = "Logged out"
		redirect_to(:action => 'login')
  end
  
end
