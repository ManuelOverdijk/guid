class Token < ActiveRecord::Base
	validates :token, presence: true, uniqueness: true
	validates :timevalid, presence: true
	validates :user_id, presence:true 
	belongs_to :user
	before_create :create_encrypted_hash

	def Token.encrypt_hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_encrypted_hash
			self.token = Token.encrypt_hash(self.token)
		end

end
