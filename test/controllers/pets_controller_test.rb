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
      post "/users.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      post "/sessions.json", params: { email: "test@test.com", password: "password" }
      post "/pets.json", params: { name: "Mars", age: 10, breed: "Labrador"}
      assert_response 200
    end
  end
end
