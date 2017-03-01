class AccountsController < ApplicationController
  
  def new
    @account = Account.new
  end

  def create
    @account = current_member.accounts.build(account_params)

    if @account.save
      flash.now[:notice] = "Account Details Successfully Updated"
      redirect_to office_settings_path
    else
      flash[:error] = "An error occured. Check your details and try again."
      redirect_to office_settings_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def account_params
    params.require(:account).permit(:bank_name, :acc_name, :acc_no, :phone)
  end
end
