class ArticlesController < ApplicationController
 
before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
     # @article = Article.find(params[:id])
    end

    def index
      @articles = Article.all 
      
    end
    
    def new
      @article = Article.new
    end

    def edit
                         
      #@article = Article.find(params[:id])
    end

    def create
          
      @article = Article.new(article_params)  #(params.require(:article).permit(:title, :description))

     if @article.save
       flash[:notice] = "Article was created sucessfully."

      #redirect_to article_path(@article)# There is shot cut for this also
       redirect_to @article
        else
          render 'new' #render the new form again
        end

    end
       def update
       # @article = Article.find(params[:id])
        if @article.update(article_params)  #(params.require(:article).permit(:title, :description)) 
           flash[:notice] = "Article was updated sucessfully." #very similar to the create action
           redirect_to@article
        else
          render 'edit'
          
       end
  end
       def destroy
        #  @article = Article.find(params[:id])
          @article.destroy
          redirect_to articles_path
       end

end

       private

       def set_article
       @article = Article.find(params[:id])
       end

       def article_params
        params.require(:article).permit(:title, :description)
       end
