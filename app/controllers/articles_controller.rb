class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit,:update,:show,:destroy]
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end
    
    def edit
    end
    
    def destroy
        @article.destroy
        flash[:notice] = "Articles is succesfully deleted."
        redirect_to articles_path
    end
    
    def update
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
    end
    
    private
        def set article
            @article = Article.find(params[:id])
        end
        def articles_params
            params.require(:article).permit(:title, :description)
        end
end