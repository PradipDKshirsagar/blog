require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should create comment" do
    article = articles(:one)
    assert_difference 'article.comments.count' do
      post article_comments_url(article.id), 
      params: { comment: { body: 'Rails is awesome!', commenter: 'pradip@123' } },
      headers: { 'Authorization': ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
    end

    assert_redirected_to article_path(article)
  end

  test "should destroy comment" do
    article = articles(:one)
    comments = article.comments
    assert_difference('article.comments.count', -1) do
      delete article_comment_url(article.id ,comments.first.id),
      headers: { 'Authorization': ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
    end
   
    assert_redirected_to article_path(article)
  end
end
