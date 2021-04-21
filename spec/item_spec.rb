require 'rspec'
require './lib/item'

RSpec.describe Item do
  describe 'instantiation' do
    it '::new' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(item1).to be_an_instance_of(Item)
    end

    it '#name' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(item1.name).to eq('Peach Pie (Slice)')
    end

    it '#price' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(item1.price).to eq(3.75)
    end
  end

  describe 'methods' do

  end
end
