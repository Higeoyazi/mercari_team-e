require 'rails_helper'

describe Address do
  let(:user) { create(:user) }
  
  describe '#create' do

    context 'can save' do
      it 'is valid with a postal_code, prefecture, city, block, building' do
        expect(build(:address)).to be_valid
      end

      it 'is valid without a building' do
        address = build(:address, building: "")
        expect(address).to be_valid
      end

    end

    # context 'can not save' do
    #   it 'is invalid without a postal_code' do
    #     address = build(:address, user: user, postal_code: "")
    #     address.valid?
    #     expect(address.errors[:postal_code]).to include('を入力してください。')
    #   end

    #   it 'is invalid without a prefecture' do
    #     address = build(:address, user: user, prefecture: "")
    #     address.valid?
    #     expect(address.errors[:prefecture]).to include('を入力してください。')
    #   end

    #   it 'is invalid without a city' do
    #     address = build(:address, user: user, city: "")
    #     address.valid?
    #     expect(address.errors[:city]).to include('を入力してください。')
    #   end

    #   it 'is invalid without a block' do
    #     address = build(:address, user: user, block: "")
    #     address.valid?
    #     expect(address.errors[:block]).to include('を入力してください。')
    #   end

    end
  end
end
