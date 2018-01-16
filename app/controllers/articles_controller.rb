class ArticlesController < ApplicationController
	before_action :asd, only: [:edit, :show, :update, :destroy, :destroy_comment]

	http_basic_authenticate_with name: "dhh", password: "secret"
	def index
		@articles = Article.all
	end

	def show 
	end

  def new
  	@article = Article.new
  end

  def edit
  end
 
  def create
  	@article = Article.new(article_params)

  	if @article.save
  		redirect_to @article
  	else
  		render 'new'
    end
  end



  def update
  	@article.comments.build(comment_params)
  	if @article.update(article_params)
  		redirect_to @article
  	else
  		render 'edit'
  	end
  end
  
  def destroy
  	@article.destroy

  	redirect_to articles_path


  end

  def destroy_comment
    @comment = @article.comments.find(params[:comment_id])
    @comment.destroy
    render 'show'
  end



  private 
	def asd
		@article = Article.find(params[:id])
	end
  	def article_params
  		params.require(:article).permit(:title, :text)
	end
	def comment_params
		params.require(:article).require(:comment).permit(:commenter, :body)
	end
end