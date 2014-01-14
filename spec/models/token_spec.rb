require 'spec_helper'

describe Token do
  
  it "is invalid without token" do
    expect(build(:token, token: nil)).to have(1).errors_on(:token)
  end

  it "is invalid withoud user_id" do
    expect(build(:token, user_id: nil)).to have(1).errors_on(:user_id)
  end

  it "is invalid without timevalid" do
    expect(build(:token, timevalid: nil)).to have(1).errors_on(:timevalid)
  end

  it "is invalid with a duplicate token" do
    create(:token, token: "abc", timevalid: 10)
    token = build(:token, token: "abc", timevalid: 10)
    expect(token).to have(1).errors_on(:token)
  end

  it "had a valid factory" do
    expect(build(:token)).to be_valid
  end

  it "had an invalid timevalid value" do
    expect(build(:token, timevalid: -10)).to have(1).errors_on(:timevalid)
  end

end