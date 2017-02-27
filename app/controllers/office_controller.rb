class OfficeController < ApplicationController
 
 layout "office"

 before_action :authenticate_member!

  def index
  	@member = Members.find(params[:id])
  end
end
