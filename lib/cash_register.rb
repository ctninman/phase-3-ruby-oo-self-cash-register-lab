require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :most_recent_addition

  def initialize (discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @most_recent_addition

  end

  def total=(total)
    @total = total
  end

  def add_item (title, price, quantity = 1)
    self.total += price * quantity
    quantity.times { items << title }
    @most_recent_addition = price * quantity

  end

  def apply_discount 
    if @discount == 0
      "There is no discount to apply."
    else
      self.total -= (self.total * @discount / 100)
      "After the discount, the total comes to $#{self.total}."
    end
  end

  bimbo = CashRegister.new (20)
  bimbo.apply_discount

  def items
    @items
    
  end

  def void_last_transaction
    self.total -= @most_recent_addition

  end

end
