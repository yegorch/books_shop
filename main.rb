require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'
require_relative 'lib/cart'
require_relative 'lib/product_collection'

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :name)
collection = collection.to_a

busket = Cart.new
user_input = -1

until user_input == 0
  puts "Что хотите купить: "
  collection.reject!{ |product| product.amount == 0}
  collection.each_with_index do |product, i|
    puts "#{i + 1}. #{product}"
  end

  puts "0. Выход"
  user_input = STDIN.gets.to_i

  if user_input > 0 && user_input <= collection.length
    busket.add_product(collection[user_input - 1])
  end
end

if busket.products.length > 0
  puts "Вы купили:"
  puts busket.result
  puts "С Вас — #{busket.products.sum(&:price)} руб. Спасибо за покупки!"
end
