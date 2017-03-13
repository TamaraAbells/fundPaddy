class OfficeController < ApplicationController
 
 layout "office"

 before_action :authenticate_member!

  def index
  	@member = current_member

    if current_member.status == 1
        flash[:error] = "YOU BROKE THE RULES!!!"
        redirect_to blocked_members_path
      end
  end


  def profile
    @member = current_member

  end


  def settings

  	@member = current_member

    @check_account = current_member.accounts.first

    if @check_account.nil?
      @set_account = @member.accounts.build
    else
      @account = current_member.accounts.first
    end

  end

  def profile
    @member = current_member
  end

  def restricted
    if current_member.email != "johndoe@gmail.com"
      flash[:error] = "You are not authorized to access this page"
      redirect_to new_member_session_path
    else
      flash.now[:notice] = "Welcome to restricted access"

    end

   
  end

  def dispatcher
      if current_member.email != "johndoe@gmail.com"
      flash[:error] = "You are not authorized to access this page"
      redirect_to new_member_session_path
    else
      flash.now[:notice] = "Welcome to restricted access"

    end

     @unmatched_withdrawals = Withdrawal.unmatched
    @available_donations = Donation.unmatched
    @member = current_member

  end

  def rematcher
      if current_member.email != "johndoe@gmail.com"
      flash[:error] = "You are not authorized to access this page"
      redirect_to new_member_session_path
    else
      flash.now[:notice] = "Welcome to restricted access"

    end

    @matched_donations = Donation.matched
    @available_donations = Donation.unmatched
    @member = current_member
  end



end
