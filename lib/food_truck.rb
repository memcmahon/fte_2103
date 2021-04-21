class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    # if @inventory[item] != nil #if key exists
    #   @invetory[item]
    # else
    #   0
    # end
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    # total = 0
    # @inventory.each do |item, amount|
    #   total += item.price * amount
    # end
    # total

    @inventory.sum do |item, amount|
      item.price * amount
    end
  end
end
