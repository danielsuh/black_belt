class BorrowersController < ApplicationController
  def new
  end

  def create
    @borrower = Borrower.new(borrower_params)
    if @borrower.save
      flash[:msg] = "Please sign in with your new credentials"
      redirect_to "/borrowers/login"
    else
      flash[:errors] =@borrower.errors.full_messages
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
    @borrower = Borrower.find(params[:id])
    @lenders = @borrower.histories
    render 'show'
  end

  def index
  end

  def destroy
  end

  private
  def borrower_params
    params.require(:borrower).permit(:first_name, :last_name, :email, :money, :password, :password_confirmation, :purpose, :description, :raised)
  end
end
