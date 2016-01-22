class SessionsController < ApplicationController
  def new
  	render 'new'
  end

  def lender_create
  	user = Lender.find_by(email: params[:Email])
  	if user && user.authenticate(params[:Password])
  		session[:user_id] = user.id
  		session[:user_name] = user.first_name
  		redirect_to "/lenders/#{user.id}"
  	else
  		flash[:msg] = "Invalid email/password combination"
  		redirect_to "/lenders/login"
  	end
  end

  def borrower_create
  	user = Borrower.find_by(email: params[:Email])
  	if user && user.authenticate(params[:Password])
  		session[:user_id] = user.id
  		session[:user_name] = user.first_name
  		redirect_to "/borrowers/#{user.id}"
  	else
  		flash[:msg] = "Invalid email/password combination"
  		redirect_to "/borrowers/login"
  	end
  end

  def destroy
  	session.delete(:user_id)
  	redirect_to "/sessions/new"
  end
end
