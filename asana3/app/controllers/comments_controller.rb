class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def new
        @comment = Comment.new
        @comment.build_picture
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def create
        @comment = Comment.new(comment_params)  

        if @comment.save
            redirect_to comment_path(@comment),notice: 'Comment is successfully created.'
        else
            render :new, notice: 'Comment not created.'    
        end

    end

    def update 
        @comment = Comment.find(params[:id])

        if @comment.update(comment_params)
           redirect_to @comment ,notice: 'Comment Successfully updated.'
        else
           render :edit, notice: 'Comment is not updated.'
        end

    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

      # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
        params.require(:comment).permit(:task_id, :commenter, :body, picture_attributes: [:id, :photo])
    end

end
