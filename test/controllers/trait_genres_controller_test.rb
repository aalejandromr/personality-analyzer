require 'test_helper'

class TraitGenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trait_genre = trait_genres(:one)
  end

  test "should get index" do
    get trait_genres_url
    assert_response :success
  end

  test "should get new" do
    get new_trait_genre_url
    assert_response :success
  end

  test "should create trait_genre" do
    assert_difference('TraitGenre.count') do
      post trait_genres_url, params: { trait_genre: {  } }
    end

    assert_redirected_to trait_genre_url(TraitGenre.last)
  end

  test "should show trait_genre" do
    get trait_genre_url(@trait_genre)
    assert_response :success
  end

  test "should get edit" do
    get edit_trait_genre_url(@trait_genre)
    assert_response :success
  end

  test "should update trait_genre" do
    patch trait_genre_url(@trait_genre), params: { trait_genre: {  } }
    assert_redirected_to trait_genre_url(@trait_genre)
  end

  test "should destroy trait_genre" do
    assert_difference('TraitGenre.count', -1) do
      delete trait_genre_url(@trait_genre)
    end

    assert_redirected_to trait_genres_url
  end
end
