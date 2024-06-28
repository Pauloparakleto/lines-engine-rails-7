require "spec_helper"

module Lines

  describe Picture do
    it "has a valid factory" do
      FactoryBot.create(:picture).should be_valid
    end

    it "should trigger :update_used_images after save" do
      pic = FactoryGirl.create(:picture)
      article = FactoryBot.create(:article, content: "![Alt text](#{pic.image.url})")
      article.should_receive(:update_used_images)
      article.save
    end

    it "should belong to article after used in article.content" do
      pic = FactoryBot.create(:picture)
      article = FactoryBot.create(:article, content: "![Alt text](#{pic.image.url})")
      article.used_images.should == [pic.id]
      article.pictures.first.should eq pic
    end
  end

end
