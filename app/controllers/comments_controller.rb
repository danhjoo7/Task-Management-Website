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
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:name, :content)
    end
end
