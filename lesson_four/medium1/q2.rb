class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end



# will fail when update_quantity is called.
# on line 11, the quantity setter method is attempted to be set, but
# there is no setter method for quantity, and even if there was, there would need to be a self.
#to fix, change the quantity to @quantity, referncing the instnace var directly.
