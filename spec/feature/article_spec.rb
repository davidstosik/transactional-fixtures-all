require "rails_helper"

RSpec.describe Article, type: :feature do
  it "breaks MySQL" do
    visit root_path
    click_on "update all"

    Article.delete_all
  end
end
