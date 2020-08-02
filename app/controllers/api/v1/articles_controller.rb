module Api

    module V1
        class ArticlesController < ApplicationController
            def index
                articles = Article.order('created_at DESC');
                # render json: {status: 'SUCCESS', message: 'Loaded articles', data: articles},status: :ok
                render status: 200, json: {message: 'Loaded articles', data: articles}
                # render status: 200, json: {article: @articles.to_json}
            end

            def show
                article = Article.find(params[:id])
                render status: 200, json: {article: article}
                # render status: 200, json: {article: article.to_json}
                # render json: {status: 'SUCCESS', message: 'Loaded article', data:article},status: :ok
            end

            def create
                article = Article.new(article_params)

                if article.save
                    render status: 200, json: {article: article.to_json, message: "saved successfully"}
                else
                    # render status: 500, json: {error: "Server error"}
                    render status: 500, json: {article: student.to_json, 
                                                message: "Article not saved",
                                                data:article.errors}
                end
            end

            def destroy
                article = Article.find(params[:id])
                article.destroy
                render status: 200, json: {article: article.to_json, message: "Deleted successfully"}
            end

            def update
                article = Article.find(params[:id])
                if article.update_attributes(article_params)
                    render status: 200, json: {article: article.to_json, message: "update successfully"}
                else
                    render status: 500, json: {article: student.to_json, 
                                                message: "Article not updated",
                                                data:article.errors}
                end

            end

            private

            def article_params
                params.permit(:title, :body)
            end
        end
    end

end