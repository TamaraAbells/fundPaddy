class NotifierMailer < ApplicationMailer
	
	default from: "help@fundpaddy.com"

	def match_email(member) 

		@member = member
		@url = "http://fundpaddy.com"
		mail(to: @member.email, subject: 'You Have Been Matched')
	end

	def welcome_email(member)
		@member = member
		@url = "http://fundpaddy.com"
		mail(to: @member.email, subject: "Welcome to fundPaddy!")
	end

	def new_member_alert
		@url = "http://fundpaddy.com"
		mail(to: "help.fundpaddy@gmail.com", subject: "New Member Signed Up!")
	end
end
