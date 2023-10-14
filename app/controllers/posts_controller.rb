class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
   def toppage
   end

   def syouyu
    @posts = Post.all
  end
  def sio
    @posts = Post.all
  end
  def miso
    @posts = Post.all
  end
  def tonkotu
    @posts = Post.all
  end
  def iekei
    @posts = Post.all
  end
  def zirou
    @posts = Post.all
  end


   def index
      
    if params[:search] == nil
      @posts= Post.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    elsif params[:search] == ''
      @posts= Post.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    else
      @posts = Post.where("name LIKE ? ",'%' + params[:search] + '%')
    end
    
   end

   

    def new
        @posts = Post.new
    end
    
      def create
        post = Post.new(post_params)
        post.user_id = current_user.id
        if post.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = Comment.new
      end

      def edit
        @post = Post.find(params[:id])
      end

      def update
        post = Post.find(params[:id])
        if post.update(post_params)
          redirect_to :action => "show", :id => post.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to action: :index
      end

      private
      def post_params
        params.require(:post).permit(:name, :nedan, :image,:overall,:category)
      end
end
