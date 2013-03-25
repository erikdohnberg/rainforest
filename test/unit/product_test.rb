require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  @p = FactoryGirl.create(:product)
  assert @p.valid?
  end

	# Different format then "def Test_must_have_a_description"
  test "Must have a description" do
  	@p.description = ""
  	refute @p.valid?
  end

  test "must have a name" do
  	@p.name = ""
  	refute @p.valid?
  end

  test "price_in_cents must be an integer" do
  	@p.price_in_cents = 1.5
  	refute @p.valid?
  end

  test "must have price_in_cents" do
  	@p.price_in_cents = nil
  	refute @p.valid?
  end


  # Shows that in products.rb you can call a class within a custom symbol because rails is so smart!
  # test "This is a cheap book" do
  # 	@p2 = FactoryGirl.create(:cheap_product)
  # end

end
