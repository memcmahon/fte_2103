require 'date'

class Event
  attr_reader :name, :food_trucks, :date

  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today.strftime('%d/%m/%Y')
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.check_stock(item) > 0
    end
  end

  def total_inventory
    total_inventory = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        if total_inventory[item].nil? #if the key does not yet exist
          total_inventory[item] = {
            quantity: 0,
            food_trucks: []
          }
        end
        total_inventory[item][:quantity] += amount
        total_inventory[item][:food_trucks] << truck
      end
    end
    total_inventory
  end

  def overstocked_items
    overstocked_items = []
    total_inventory.each do |item, info|
      if info[:quantity] > 50 && info[:food_trucks].length > 1
        overstocked_items << item
      end
    end
    overstocked_items
  end

  def sorted_item_list
    # get a list of all items sold
    all_items = total_inventory.keys
    #sort that list by name
    sorted_items = all_items.sort_by do |item|
      item.name
    end
    #return only the names
    sorted_items.map do |item|
      item.name
    end
  end
end
