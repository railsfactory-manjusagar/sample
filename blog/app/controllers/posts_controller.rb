class PostsController < ApplicationController
  
 def index
   @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
      flash[:notice] = "item added"
    @post_success = Post.new(params[:post].permit(:name,:status))
           
      if @post_success.save
        redirect_to posts_path,:notice=>"item saved"
      else
        render "new"
      end
  end

  def edit
      @post = Post.find(params[:id])
     
  end

  def update
      @post = Post.find(params[:id])
     if @post.update_attributes(params[:post].permit('name','status'))
        redirect_to posts_path,:notice=>"item updated"
     else
    render "edit"
  end  
  
  end

  def destroy
        @post = Post.find(params[:id])
     if @post.destroy
      redirect_to posts_path, :notice=>"item deleted"
     end
  end
 
 
end
 
