class DonationsController < ApplicationController


layout 'office'


before_action :authenticate_member!

  def index
    @donations = current_member.donations.order(created_at: :desc)
    @member = current_member

    @withdrawal = current_member.withdrawals.new

  end

  def new
    @member = current_member
    @donation = @member.donations.build
  end

  def create
    @donation = current_member.donations.build(donation_params)

    if @donation.save
      flash[:notice] = "Thanks, your donation was created successfully"
      redirect_to member_donation_path(member_id: current_member, id: @donation)
    else
      flash[:error] = "Error creating your donation. try again"
      render 'new'
    end

  end

  def show
      @member = current_member
      @donation = Donation.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def donation_confirm
    
    if (params[:complete] && params[:withdrawal_id])
      withdrawal_id = params[:withdrawal_id]
        withdrawal = Withdrawal.find(withdrawal_id)
        withdrawal.update(status: 'completed')
    end


    if params[:donation_id]

        donation_id = params[:donation_id]

        donation = Donation.find(donation_id)
        if donation.update(status: 'confirmed')
          flash[:notice] = "Payment confirmed"
          redirect_to member_withdrawals_path(current_member)

        else
          flash[:error] = "There was a problem confirming this payment. Try again"
          redirect_to member_withdrawals_path(current_member)
        end
    else
        flash[:error] = "Unauthorized Access"
        redirect_to member_withdrawals_path(current_member)
    end

  end

  private 
  def donation_params
    params.require(:donation).permit(:amount, :plan, :comment)
  end
end
