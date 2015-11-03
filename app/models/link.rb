class Link < ActiveRecord::Base
	
	def generate_slug
		self.slug = self.id.to_s(36)
		self.save
	end

	def display_slug
		ENV['BASE_URL'] + self.slug
	end

	def screenshot_scrape
		Screenshot.perform_async(self.id)
		Scrape.perform_async(self.id)
	end

end
