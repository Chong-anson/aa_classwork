class PostsController < ApplicationController
    def new 
        @post = Post.new 
        @subs = Sub.all
        render :new 
    end 

    def create
        # debugger
        # ids = params[:post][:sub_ids]
        # ids.map! { |id| id.to_i }
        # debugger
        @post = Post.new(post_params)
        # content = params[:post][:content].strip
        # @post.content = content
        @post.author_id = current_user.id
        @subs = Sub.all

        if @post.save
            redirect_to subs_url
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end 

    def edit 
        @post = Post.find_by(id: params[:id])
        @subs = Sub.all
        if @post 
            render :edit
        else 
            flash[:errors] = ["Post not found"]
            redirect_to subs_url
        end 
    end 

    def update 
        @post = Post.find_by(id: params[:id])
        if @post && @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end 

    def show 
        @post = Post.find_by(id: params[:id])
        @all_comments = @post.comments.includes(:author)
        if @post 
            @author = User.find_by(id: @post.author_id)
            render :show 
        else 
            flash[:errors] =["Invalid post"]
            redirect_to subs_url
        end 
    end 

    private 
    def post_params
        params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end 
end
