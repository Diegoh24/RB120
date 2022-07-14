
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# not necessarily, but it will allow the quantity to be changed from outside the class.
# it will also allow the product name to be changed outside the class.
# a more appropriate way could be keeping attr_reader for the product name
# and below that putting attr_accessor for quantity.
