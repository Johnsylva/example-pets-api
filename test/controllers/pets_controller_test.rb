require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "index" do
    get "/pets.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Pet.count, data.length
  end

  test "create" do
    assert_difference "Pet.count", 1 do
      post "/pets.json", params: { name: "Mars", age: 10, breed: "Labrador"}
      assert_response 200
    end
  end
end
