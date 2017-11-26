# app/models/comment.rb

class Comment < ActiveRecord::Base
  belongs_to :article
end
