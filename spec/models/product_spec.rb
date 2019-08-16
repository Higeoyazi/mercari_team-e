require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Product do

  describe '#create' do

    context 'can save' do
      it 'is valid with a image_url,name,description,category,quality,delivery_orign,prep_days,price' do
        expect(build(:product)).to be_valid
      end
    end

  end

end