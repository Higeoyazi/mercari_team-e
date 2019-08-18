require 'rails_helper'

describe Product do
  let(:category) { create(:category) }
  let(:user) { create(:user) }

  describe '#create' do

    context 'can save' do
      it 'is valid with a image_url,name,description,category,quality,delivery_orign,prep_days,price' do
        expect(build(:product,category: category,user: user)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without a name' do
        product = build(:product,category: category,user: user, name: "")
        product.valid?
        expect(product.errors[:name]).to include('を入力してください。')
      end

      it 'is invalid without a description' do
        product = build(:product, category: category,user: user,description: "")
        product.valid?
        expect(product.errors[:description]).to include('を入力してください。')
      end

      it 'is invalid without a price' do
        product = build(:product, category: category,user: user,price: "")
        product.valid?
        expect(product.errors[:price]).to include('を入力してください。')
      end


      it 'is invalid without a quality' do
        product = build(:product, category: category,user: user,quality: "")
        product.valid?
        expect(product.errors[:quality]).to include('を入力してください。')
      end

      it 'is invalid without a delivery_origin' do
        product = build(:product, category: category,user: user,delivery_origin: "")
        product.valid?
        expect(product.errors[:delivery_origin]).to include('を入力してください。')
      end

      it 'is invalid without a delivery_cost' do
        product = build(:product,category: category,user: user, delivery_cost: "")
        product.valid?
        expect(product.errors[:delivery_cost]).to include('を入力してください。')
      end

      it 'is invalid without a prep_days' do
        product = build(:product, category: category,user: user,prep_days: "")
        product.valid?
        expect(product.errors[:prep_days]).to include('を入力してください。')
      end

      it "is invalid without a price that has less than 300yen" do
        product = build(:product, price: 299,category: category,user: user)
        product.valid?
        expect(product.errors[:price]).to include("は300以下の値で入力ください")
      end

      it "is invalid without a product_price over 10000000" do
        product = build(:product,price:10000000,category: category,user: user)
        product.valid?
        expect(product.errors[:price]).to include("は9999999以下の値にしてください")
      end


    end
  end
end

