class WithdrawalsController < ApplicationController
  
  layout 'office'
  before_action :authenticate_member!

  def index
    @withdrawals = current_member.withdrawals.order(created_at: :desc)
  end

  def new
    @withdrawal = current_member.withdrawals.build(withdrawal_params)
  end

  def show
  end

  

  def create
    @withdrawal = current_member.withdrawals.build(withdrawal_params)

    if @withdrawal.save
      #update donations status
      donation_id = @withdrawal.donation_id
      donation = Donation.find_by_id(donation_id)
      
      donation.update(status: 'completed')

      #show flash and redirect user
      flash[:notice] = "Withdrawal Created Successfully"
      redirect_to member_withdrawals_path(current_member)
    else
      flash[:error] = "Failed to create withdrawal request"
      render 'index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def withdrawal_params
    params.require(:withdrawal).permit(:plan, :amount, :status, :donation_id)
  end
end
