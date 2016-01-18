module UsersHelper
	def my_error(x)
		if x.errors.full_messages.any? 
			x.errors.full_messages.each do |e|
				content_tag :li, e
			end
		end
	end
end
