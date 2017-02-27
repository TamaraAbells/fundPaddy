class OfficeController < ApplicationController
 
 layout "office"

 before_action :authenticate_member!

  def index
  	flash[:notice] = "This is your Office"
  	@member = current_member
  end
end
