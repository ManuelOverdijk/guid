class Token < ActiveRecord::Base
	validates :token, presence: true, uniqueness: true
	validates :timevalid, presence: true
	validates :user_id, presence:true 
	belongs_to :user

end
