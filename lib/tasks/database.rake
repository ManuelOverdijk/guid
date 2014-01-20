namespace :guid do
  task delete_old_tokens: :environment do
    Token.where("timevalid < ?", DateTime.now.to_i + 3600).each do |token|
      token.destroy
    end
  end
end
