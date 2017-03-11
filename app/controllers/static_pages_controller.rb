class StaticPagesController < ApplicationController

layout "static_pages"  

  def home

  	@message = Message.new

  end

  def send_message 
  	email = params[:email]
  	content = params[:content]

  	@message = Message.new(email: email, content: content)

  	if @message.save
  		flash[:notice] = "Thank you for your thought. we will get back to you :)"
  		redirect_to root_path
  	else
  		flash[:error] = "There was a problem sending your message"
  		redirect_to root_path
  	end
  end
  
  def about
  end

  def terms
    @message = Message.new

  end

  def blocked
    @message = Message.new

  end

  def howitworks
  end

  def promotions
  end
end
