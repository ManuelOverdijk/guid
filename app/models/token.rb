class Token < ActiveRecord::Base
	validates :token, presence: true, uniqueness: true

end
