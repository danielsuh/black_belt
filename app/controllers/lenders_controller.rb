class LendersController < ApplicationController
  def new
  end

  def create
    @lender = Lender.new(lender_params)
    if @lender.save
      flash[:msg] = "Please sign in with your new credentials"
      redirect_to "/lenders/login"
    else
      flash[:errors] =@lender.errors.full_messages
      redirect_to "/sessions/new"
    end
  end

  def login
    render 'login'
  end

  def edit
  end

  def update
  end

  def show
    @lender = Lender.find(params[:id])
    @borrowers = Borrower.all
    @borrowed = @lender.histories
    render 'show'
  end

  def index
  end

  def destroy
  end

  private
  def lender_params
    params.require(:lender).permit(:first_name, :last_name, :email, :money, :password, :password_confirmation)
  end
end
