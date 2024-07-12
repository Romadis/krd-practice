class Product 
  attr_reader :quantity, :title

  def initialize(title, price, weight, quantity)
    @title = title
    @price = price
    @weight = weight
    @quantity = quantity
  end

  def output 
    "Product: #{@title}, quantity: #{@quantity}"
  end

  def calc_overall_weight
    overall_weight = if @title == "Water"
      @quantity * @weight * 2
    else
      @quantity * @weight
    end

    "#{@title} overall weight: #{overall_weight}"
  end

  def set_quantity(value)
    @quantity = value

    "Current quantity: #{@quantity}"
  end
end
