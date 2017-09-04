300.times do |i|
  Product.seed_once(:id) do |product|
    product.id = i + 1
    product.name = "#{ i + 1 }番目の商品"
    product.description = "#{ i + 1 }番目の商品説明文"
    product.price = (i + 1) * 10
    product.category_id = rand(1..5)
  end
end