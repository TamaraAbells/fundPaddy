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

  def invite
    @message = Message.new

  end

  def send_invite
    @email = params[:email]
    if @email
      NotifierMailer.send_invite(@email).deliver
      flash[:notice] = "Succesfully sent invite. Kindly notify your invites to use your email as 'referrer' when signing up"
      redirect_to root_path
    else
      flash[:error] = "There was an error sending email to invite"
      redirect_to root_path
    end
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
