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

end
