require 'faker'

FactoryBot.define do
  factory :article, :class => Lines::Article do |f|
    title { "Testing with RSpec" }
    sub_title { "My subtitle" }
    content { "Content for article" }
    published_at { Time.now }
    hero_image { File.open(File.join(Lines::Engine.root, 'spec/support/images/example.jpg')) }
    author_ids   {
      count = 0
      Array(5..10).sample.times.map do
        count += 1
        FactoryBot.create(:author, :name => "Author #{count}", :email => "author#{count}@example.com", :description => "desc#{count}")[:id]
      end
    }

    factory :article_with_tags, class: Lines::Article do |a|
     tag_list { 'tag1, tag2' }
    end
  end
end
