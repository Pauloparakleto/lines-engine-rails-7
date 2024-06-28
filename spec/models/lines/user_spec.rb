require "spec_helper"

module Lines

  describe User do
    it "has a valid factory" do
      FactoryBot.create(:user).should be_valid
    end

    it "is invalid without an email" do
      FactoryBot.build(:user, email: nil).should_not be_valid
    end

    it "is invalid without a password" do
      FactoryBot.build(:user, password: nil).should_not be_valid
    end
  end
end
