require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  
  test "should new action" do 
    article = Article.new
    get new_article_url(article),
    headers: { 'Authorization': ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
  end

  test "should not create article and render new" do
    assert_difference 'Article.count', 0 do
      post articles_url, 
      params: { article: { body: 'Rails is awesome!', title: 'Hel' } },
      headers: { 'Authorization': ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
    end

    assert_template :new
  end

  test "should create article with flash" do
    assert_difference 'Article.count' do
      post articles_url, 
      params: { article: { body: 'Rails is awesome!', title: 'Hello Rails' } },
      headers: { 'Authorization': ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
    end

    assert_redirected_to article_path(Article.last)
    assert_equal 'Article was successfully created.', flash[:notice]
  end

  test "should show article" do
    article = articles(:one)
    get article_url(article)
    assert_response :success
  end

  test "should show all articles" do
    articles = Article.all 
    get articles_url(articles)
    assert_response :success
  end

  test "should edit action" do 
    article = articles(:one)
    get edit_article_url(article),
    headers: { 'Authorization': ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
  end
  
  test "should update article" do
    article = articles(:one)
   
    put article_url(article), params: { article: { title: "updated" } },
    headers: { 'Authorization': ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
   
    assert_redirected_to article_path(article)
    # Reload association to fetch updated data and assert that title is updated.
    article.reload
    assert_equal "updated", article.title
  end

  test "should not update article and render edit" do
    article = articles(:one)
    
    put article_url(article), params: { article: { title: "upd" } },
    headers: { 'Authorization': ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
   
    assert_template :edit
  end

  test "should destroy article" do
    article = articles(:one)
    assert_difference('Article.count', -1) do
      delete article_url(article),
      headers: { 'Authorization': ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
    end
   
    assert_redirected_to articles_path
  end
end
