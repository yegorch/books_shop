class Cart
  attr_reader :products

  def initialize
    @products = []
  end

  def result
    @products.uniq.map do |product|
      "#{product.to_s} #{@products.count(product)} шт."
    end
  end

  def add_product(product)
    if product.amount > 0
      @products << product
      product.amount -= 1
    end
  end
end