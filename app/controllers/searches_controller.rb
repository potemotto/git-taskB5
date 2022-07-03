class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model] #検索モデル

    @content = params[:content] #検索ワード表示用

    if @model == "User" # if文で検索モデルで条件分岐
      @users = User.looks(params[:method], params[:content]) #検索方法,検索ワード
    else
      @books = Book.looks(params[:method], params[:content]) #検索方法,検索ワード
    end
  end
end
