module ArticlesHelper
  # Helper method using 'strong parameters'. 'require' and 'permit' allow us to declare which attributes we'd like to accept
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
