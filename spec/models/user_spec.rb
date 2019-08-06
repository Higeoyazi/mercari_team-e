require 'rails_helper'

describe User do

  describe '#create' do
    
    context 'can save' do
      it 'is valid with a nickname, email, birthday, password, password_confirmation' do
        expect(build(:user)).to be_valid
      end

      it 'is valid with a password that has more than 6 characters' do
        user = build(:user, password: '1234567', password_confirmation: '1234567')
        expect(user).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without a nickname' do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include('を入力してください。')
      end

      it 'is invalid without email' do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include('を入力してください。')
      end

      it 'is invalid without birthday' do
        user = build(:user, birthday: "")
        user.valid?
        expect(user.errors[:birthday]).to include('を入力してください。')
      end

      it 'is invalid with birthday except 8 characters' do
        user = build(:user, birthday: "123456789")
        user.valid?
        expect(user.errors[:birthday]).to include('は8文字で入力してください。')
      end     

      it 'is invalid without password' do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include('を入力してください。')
      end

      it 'is invalid without password_confirmation although with a password' do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include('とPasswordの入力が一致しません。')
      end

      it 'is invalid with a duplicate email address' do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include('はすでに存在します。')
      end

      it 'is invalid with a password that has less than 6 characters' do
        user = build(:user, password: '12345', password_confirmation: '12345')
        user.valid?
        expect(user.errors[:password][0]).to include('は6文字以上で入力してください')
      end
    end
  end


end
