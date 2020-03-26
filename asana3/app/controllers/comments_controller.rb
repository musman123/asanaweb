class CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
        @comment.build_picture
    end
    def create
        @comment = Comment.new(comment_params)  
        redirect_to comment_path(@comment)
      end
     
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body, picture_attributes: [:id, :photo])
        end
end