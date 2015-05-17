class CommentsController < ApplicationController

	def create
		# c = Comment.new
		# c.username = params[:username]
		# c.email = params[:email]
		# c.content = params[:content]
		# c.issue_id = params[:issue_id]
		# c.save
		
		@comment = Comment.new(comment_params)
		@comment.save

		#issue = Issue.find(params[:issue_id])
		# redirect_to c.issue
		
		respond_to do |format|
			format.js
		end
	end
	
	private
	def comment_params
		params.require(:comment).permit(:issue_id, :user_id, :content)
	end
end
