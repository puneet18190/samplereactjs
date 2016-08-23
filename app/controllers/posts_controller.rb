class PostsController < ApplicationController
	def index
      @posts = Post.all
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      head :no_content
    end

    private

      def post_params
        params.require(:post).permit(:title, :description)
      end
end
