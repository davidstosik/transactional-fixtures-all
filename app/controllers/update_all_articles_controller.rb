class UpdateAllArticlesController < ApplicationController
  def index
    Article.update_all(title: "updated with update_all")
    redirect_to root_path
  end
end
