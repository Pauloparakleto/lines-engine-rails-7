require "spec_helper"

module Lines

  describe Author do
    it "has a valid factory" do
      FactoryBot.create(:author).should be_valid
    end

    it "is invalid without a name" do
      FactoryBot.build(:author, name: nil).should_not be_valid
    end

    it "is invalid without an email" do
      FactoryBot.build(:author, email: nil).should_not be_valid
    end

    it "is invalid without a description" do
      FactoryBot.build(:author, description: nil).should_not be_valid
    end

    it "can not be deleted if belonging to one or more articles" do
      author = FactoryBot.create(:author)
      author.articles << FactoryBot.create(:article)
      author.destroy.should be_false
    end
  end

end
