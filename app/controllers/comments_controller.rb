class CommentsController < ApplicationController
  def create
  	Comment.create(author: current_user.first_name, context: params[:context], event_id: params[:id])
  	redirect_to "/events/#{params[:id]}"
  end

  # def delete
  # 	fail
  # 	comment = Comment.find(params[:id])
  # 	comment.destroy

  # end
end
 # event_id: params[:id]
 # event: Event.find(params[:id])