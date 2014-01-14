class AddUserToTokens < ActiveRecord::Migration
  def change
    add_column :tokens, :user_id, :int
  end
end
