20.times do
  Product.create(
    name: Faker::Superhero.name,
    category: Product::CATEGORIES.sample,
    description: Faker::Lorem.sentence(word_count: 15),
    price: rand(1..10),
    user_id: 1
  )
end
