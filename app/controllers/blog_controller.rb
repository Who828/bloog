class BlogController < ApplicationController
  def index
    post1 = @blog.new_post
    post1.title = "Paint just applied"
    post1.body = "Paint just applied. it's lovely orange-purple!"
    post1.publish
    post2 = @blog.new_post(title: "Still Wet")
    post2.body = "Paint is still quit wet. No bubbling yet!"
    post2.publish
  end
end
