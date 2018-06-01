class User < ActiveRecord::Base
	belongs_to :organization, primary_key: :id, foreign_key: :organization_id

	def self.authenticate username, password
		user = self.find_by(:email => username)
		user if user && user.id == password.to_i
	end
end