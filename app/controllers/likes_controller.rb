before_action :set_post
class LikesController < ApplicationController
def create
  @like = @post.comments.build(comment_params)
  @like.user_id = current_user.id

  if @like.save
    flash[:success] = "You commented the hell out of that post!"
    redirect_to :back
  else
    flash[:alert] = "Check the comment form, something went horribly wrong."
    render root_path
  end
end

private

def comment_params
  params.require(:like).permit(:content)
end

def set_post
  @post = Post.find(params[:post_id])
end
end
