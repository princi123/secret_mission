class SecretCode < ApplicationRecord
	belongs_to :user, optional: true
	attr_accessor :bulk_number

	def self.create_bulk_codes(num)
		(1..num.to_i).each do |num|  
		  code = (0...8).map { (65 + rand(26)).chr }.join.downcase                                        
		  SecretCode.create!(code: code)
		end   
	end
	
end
