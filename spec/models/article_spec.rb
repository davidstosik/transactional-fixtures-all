require 'rails_helper'

RSpec.describe Article, type: :model do
  it "supports transactional fixtures (1)" do
    Article.create(title: "supports transactional fixtures (1)")

    expect(Article.count).to eq 1
  end

  it "supports transactional fixtures (2)" do
    Article.create(title: "supports transactional fixtures (2)")

    expect(Article.count).to eq 1
  end

  it "does not fail when using `delete_all` ActiveRecord method" do
    3.times { |i| Article.create(title: "article #{i}") }

    Article.delete_all

    expect(Article.count).to eq 0
  end

  it "does not fail when using `update_all` ActiveRecord method" do
    3.times { |i| Article.create(title: "article #{i}") }

    Article.update_all("title = CONCAT(title, ' (updated)')")


    expect(Article.count).to eq 3
    expect(Article.pluck(:title)).to match_array(3.times.map { |i| "article #{i} (updated)" })
  end
end
