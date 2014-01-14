class AddTimevalidToTokens < ActiveRecord::Migration
  def change
    add_column :tokens, :timevalid, :int
  end
end
