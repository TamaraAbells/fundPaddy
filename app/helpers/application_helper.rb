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

	def count_referrals(member)
		referrals = Member.where(referrer: member.email)

		referrals.count
	end

	def total_earnings(member)
		withdrawals = member.withdrawals.where(status: "completed")
		sum = 0

		withdrawals.each do |withdrawal|
			w = 2 * withdrawal.amount
			sum += w 
		end 

		return sum

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

					matchtime = Time.now
					blocktime = matchtime + 86400

					d.update(status: 'matched', recipient_id: withdrawer_id, withdrawal_id: w.id, matchtime: matchtime, blocktime: blocktime)
					
					#send match email
					NotifierMailer.match_email(d.member).deliver

					results << "Notification sent!"
					results << "1 Donation matched"
				end

				w.update(status: 'matched')


					#send match email
					NotifierMailer.match_email(w.member).deliver


				results << "Successfuly matched 1 new withdrawal to 2 donations"
			else
				results << "Donations for match criteria less than 2. Kindly add new donations to package"
			end

		end

		return results
	end


	def donation_rematcher(matched_donations, available_donations)

		matched_donations = matched_donations
		available_donations = available_donations
		results = []

		matched_donations.each do |donation|
			if donation.pay_status.nil?
				
				if donation.blocktime < Time.now
					#block donation and user

					results << "Donation Timed out"

					#check for available donation in specified plan
					donation_to_match = available_donations.where(amount: donation.amount).order(created_at: 'asc')

		

					if donation_to_match.count >= 1

						new_donation = donation_to_match.first

						results << "Found 1 new donation  waiting.."

						#recipient of donation
						withdrawer_id = donation.recipient_id


						#delete donation temporarily
						donation.update(status: "deleted", recipient_id: nil)
						owner = donation.member


						withdrawal_id = donation.withdrawal_id

						#block owner
						owner.update(status: 1)

			
						matchtime = Time.now
						blocktime = matchtime + 86400

						if new_donation.update(status: 'matched', recipient_id: withdrawer_id,  withdrawal_id: withdrawal_id, matchtime: matchtime, blocktime: blocktime)
							
							#send match email
							NotifierMailer.match_email(new_donation.member).deliver

							results << "Donation  -deleted and member rematched"
						else
							results << "There was an error selecting a new donation for the member"
						end


					end

				end




			else
				results << "Note: this donation has pay_status set ..skipping"
			end


		end

		return results

	end


	def get_matched_donations(withdrawer_id, withdrawal_id)
		get_donations = Donation.where(recipient_id: withdrawer_id, withdrawal_id: withdrawal_id)

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
		recipient = Member.find_by_id(donation.recipient_id)
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
