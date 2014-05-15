class CommentsController < ApplicationController
	def create
		@reading = Reading.find(params[:reading_id])
		@comment = @reading.comments.create!(comment_params)
		@comment.creator_id = current_user.id
		@comment.save

		redirect_to @reading
	end

	def destroy
		@comment = Comment.find(params[:id])
		@reading = Reading.find(@comment.reading_id)
	    @comment.destroy
    	respond_to do |format|
    		format.html { redirect_to @reading }
     		format.json { head :no_content }
     	end
    end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end
end
