class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        
        if @article.update(articles_params)
            flash[:notice] = "Articles Update Successfully"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    def create
        #render plain: params[:article].inspect
        #this comment will render all the input.
        @article = Article.new(articles_params)
        if @article.save
            #to notice the user
            flash[:notice]= "Article was Created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    private
        def articles_params
            params.require(:article).permit(:title, :description)
        end
end