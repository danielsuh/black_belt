class HistoriesController < ApplicationController
  def new
  end

  def create
    @history = History.new(amount: params[:amount], lender_id: params[:lender_id], borrower_id: params[:borrower_id])
    @lender = Lender.find(params[:lender_id])
    @borrower = Borrower.find(params[:borrower_id])
    if @lender.money >= params[:amount].to_f && @history.save
      money = @lender.money - params[:amount].to_f
      money_raised = @borrower.raised.to_f + params[:amount].to_f
      @lender.update(money: money)
      @borrower.update(raised: money_raised)
      redirect_to "/lenders/#{params[:lender_id]}"
    else
      flash[:msg] = "Insufficient funds to lend money"
      redirect_to "/lenders/#{params[:lender_id]}"
    end
  end

  def edit
  end

  def udpate
  end

  def show
  end

  def index
  end

  def destroy
  end

  private
  # def history_params
  #   params.require(:history).permit(:amount, :lender_id, :borrower_id)
  # end
end
