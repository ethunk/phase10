# app/models/article.rb

class Article < ActiveRecord::Base
  # def comments
  #   Comment.where(article_id: id)
  # end

  has_many :comments
  #a shortcut that rails will interpret as the above object method definition.
  #so now an article's comments can be accessed by artcicle_object.comments
end
