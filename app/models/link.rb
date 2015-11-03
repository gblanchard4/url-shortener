class Link < ActiveRecord::Base
	
	def generate_slug
		self.slug = self.id.to_s(36)
		self.save
	end
end
