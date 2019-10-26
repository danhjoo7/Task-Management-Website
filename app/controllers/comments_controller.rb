class CommentsController < ApplicationController

    def index
    end

    def new
        @comment = Comment.new
    end

    def create
        byebug
        @comment = Comment.new(comment_params)
        if @comment.valid?
            @comment.save
            redirect_to comment_path(@comment)
        else
            render(:new)
        end
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        if @comment.valid?
            redirect_to comment_path(@comment)
        else
            render :edit
        end        
    end

    def destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:name, :content)
    end
end
