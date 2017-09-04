5.times do |i|
  Category.seed_once(:id) do |category|
    category.id = i + 1
    category.name = "#{ i + 1 }のカテゴリー"
  end
end