class Token < ActiveRecord::Base
	validates :token, presence: true, uniqueness: true
	validates :timevalid, presence: true

end
