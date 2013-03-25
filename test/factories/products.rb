FactoryGirl.define do

	factory :product do # Lists product attributes
		name "MyString"
		description "MyText"
		price_in_cents 9900
	end

	factory :cheap_product, :class => Product do # Lists product attributes
		name "Book"
		description "Has Pictures"
		price_in_cents 99
	end
end