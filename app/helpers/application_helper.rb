module ApplicationHelper

	def full_title(page_title= '')
		base_title = "fund+Paddy In Office"

		if page_title.empty?
		    base_title
		else
			page_title + ' | '+ base_title
		end
	end

	def get_state_color(status)
		if (status == 'waiting') || (status == 'matched')
			return 'pending-step'
		else 
			return 'step'
		end
			

	end


	def withdrawal_dispatcher(unmatched_withdrawals, available_donations)
		results = []

		unmatched_withdrawals.each do |w| 
			plan = w.plan
			amount = w.amount
			withdrawer_id = w.member_id

			# filter_donation = available_donations.find_by_sql("SELECT * FROM donations WHERE amount=? AND member_id != ? LIMIT 2", amount, withdrawer_id)
			screened_donations = available_donations.where("member_id != ?", withdrawer_id)

			filtered_donations = screened_donations.where(amount: amount).limit(2)

			if filtered_donations.count == 2

				filtered_donations.each do |d|

					d.update(status: 'matched', recipient_id: withdrawer_id)
					results << "1 Donation matched"
				end

				w.update(status: 'matched')

				results << "Successfuly matched 1 new withdrawal to 2 donations"
			else
				results << "Donations for match criteria less than 2. Kindly add new donations to package"
			end

		end

		return results
	end


	def get_matched_donations(withdrawer_id)
		get_donations = Donation.where(recipient_id: withdrawer_id)

		get_donations

	end


	def get_badge_status(status)
		 state = 'info'

		if status == "matched"
			state = 'info'
		elsif status == "confirmed"
			state = 'success'
		elsif status == "completed"
			state = 'success'
		elsif status == "deleted"
			state = 'warning'
		else
			state = 'default'
		end

		return state
	end

	def get_recipient_info(donation)
		recipient = Member.find_by_id(donation.id)
		recipient

	end

	# def active_link_to(name = nil, options = nil, html_options = nil, &block)
	#   active_class = html_options[:active] || "active"
	#   html_options.delete(:active)
	#   html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
	#   link_to(name, options, html_options, &block)
	# end


	# def custom_bootstrap_flash
	# 	  flash_messages = []
	# 	  flash.each do |type, message|
	# 	    type = 'success' if type == 'notice'
	# 	    type = 'error'   if type == 'alert'
	# 	    text = "<script>toastr.#{type}('#{message}');</script>"
	# 	    flash_messages << text.html_safe if message
	# 	  end
	# 	  flash_messages.join("\n").html_safe
	# end
end
