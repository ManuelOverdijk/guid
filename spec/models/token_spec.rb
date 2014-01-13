require 'spec_helper'

describe Token do

  before { @token = Token.new(token: "1f224fa8-f6f4-4e7d-9217-c402d01a21fd") }

  subject { @token }

  it { should respond_to(:token) }
  it { should be_valid}
  describe "when token is not present" do
    before { @token.token = " " }
    it { should_not be_valid }
  end

  describe "when token is already taken" do
    before do
      token1 = @token.dup
      token1.save
    end

    it { should_not be_valid }
  end
end