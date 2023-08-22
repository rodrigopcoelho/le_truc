require "open-uri"
require "json"

# abrir o json
json.parse("https://res.cloudinary.com/dtng1edik/image/list/upload.json")


# para cada public_id ir buscar o nome do ficheiro

# criar um produto com o nome do ficheiro
  Product.create(
    name: Faker::Superhero.name,
    category: Product::CATEGORIES.sample,
    description: Faker::Lorem.sentence(word_count: 15),
    price: rand(1..10),
    user: User.first
  )

  file = URI.open(  "https://res.cloudinary.com/dtng1edik/image/upload/v1692722346/fotos%20airbnb/fotos%20-cl/#{}.heic")
  article = Article.new(title: "NES", body: "A great console")
  article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  article.save
