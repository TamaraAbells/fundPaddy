class OfficeController < ApplicationController
 
 layout "office"

 before_action :authenticate_member!

  def index
  	flash[:notice] = "This is your Office"
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
end
