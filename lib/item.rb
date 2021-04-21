class Item
  attr_reader :name

  def initialize(item_params)
    @name = item_params[:name]
    @price_str = item_params[:price]
  end
  #
  def price
    @price_str.delete('$').to_f
  end
end
