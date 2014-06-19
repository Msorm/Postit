module ApplicationHelper
	def url(str)
		str.starts_with?("http://") ? str : "http://#{str}"
	end

	def date(dt)
		dt.strftime("%m/%d/%Y 1:%M%P %Z")
	end
end
