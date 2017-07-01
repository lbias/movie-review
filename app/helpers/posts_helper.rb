module PostsHelper
  def render_post_comment(post)
    simple_format(post.comment)
  end
end
