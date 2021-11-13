require "test_helper"

class DicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dice = dices(:one)
  end

  test "should get index" do
    get dices_url
    assert_response :success
  end

  test "should get new" do
    get new_dice_url
    assert_response :success
  end

  test "should create dice" do
    assert_difference('Dice.count') do
      post dices_url, params: { dice: { dice_number: @dice.dice_number, dice_sides: @dice.dice_sides } }
    end

    assert_redirected_to dice_url(Dice.last)
  end

  test "should show dice" do
    get dice_url(@dice)
    assert_response :success
  end

  test "should get edit" do
    get edit_dice_url(@dice)
    assert_response :success
  end

  test "should update dice" do
    patch dice_url(@dice), params: { dice: { dice_number: @dice.dice_number, dice_sides: @dice.dice_sides } }
    assert_redirected_to dice_url(@dice)
  end

  test "should destroy dice" do
    assert_difference('Dice.count', -1) do
      delete dice_url(@dice)
    end

    assert_redirected_to dices_url
  end
end
