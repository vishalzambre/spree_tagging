RSpec.describe Spree::Product, type: :model do
  context 'acts_as_taggable' do
    let(:product) { create(:product) }

    it 'should add tags' do
      product.tag_list.add('awesome')
      expect(product.tag_list).to include('awesome')
    end

    it 'should remove tags' do
      product.tag_list.remove('awesome')
      expect(product.tag_list).to_not include('awesome')
    end
  end
end
