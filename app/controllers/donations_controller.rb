class DonationsController < ApplicationController


layout 'office'


before_action :authenticate_member!

  def index
    @donations = current_member.donations
    @member = current_member
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

  private 
  def donation_params
    params.require(:donation).permit(:amount, :plan, :comment)
  end
end
