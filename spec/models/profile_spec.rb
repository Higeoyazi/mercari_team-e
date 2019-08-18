require 'rails_helper'

describe Profile do
  
  describe '#create' do

    context 'can save' do
      it 'is valid with a family_name, first_name, family_name_kana, first_name_kana, phone_number' do
        expect(build(:profile)).to be_valid
      end

      it 'is valid with a family_name_kana with "katakana"' do
        profile = build(:profile, family_name_kana: 'カタカナ')
        expect(profile).to be_valid
      end
    end

#     context 'can not save' do
#       it 'is invalid without a family_name' do
#         profile = build(:profile, family_name: '')
#         profile.valid?
#         expect(profile.errors[:family_name]).to include('を入力してください')
#       end

#       it 'is invalid without a first_name' do
#         profile = build(:profile, first_name: '')
#         profile.valid?
#         expect(profile.errors[:first_name]).to include('を入力してください')
#       end

#       it 'is invalid without a family_name_kana' do
#         profile = build(:profile, family_name_kana: '')
#         profile.valid?
#         expect(profile.errors[:family_name_kana]).to include('を入力してください')
#       end

#       it 'is invalid without a first_name_kana' do
#         profile = build(:profile, first_name_kana: '')
#         profile.valid?
#         expect(profile.errors[:first_name_kana]).to include('を入力してください')
#       end

#       it 'is invalid without a phone_number' do
#         profile = build(:profile, phone_number: '')
#         profile.valid?
#         expect(profile.errors[:phone_number]).to include('を入力してください')
#       end

#       it "is invalid with a duplicate phone_number" do
#         user = create(:user)
#         another_user = build(:user)
#         another_user.valid?
#         expect(another_user.errors[:phone_number]).to include('はすでに存在します。')
#       end

    end
  end
end

