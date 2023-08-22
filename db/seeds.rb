require "open-uri"
require "json"
require "openai"

# METHODS

def treat_name(raw_name)
  raw = raw_name[(raw_name.index("/") + 1)..]

  file_name = raw[0..(raw.index("-") - 1)]

  index_cat = raw.index("-") + 1

  category = raw[index_cat..(index_cat + 1)]

  name = file_name.gsub("_", " ").capitalize

  [name, category, file_name]
end

def choose_cat(raw_cat)
  if raw_cat == "l_"
    "leisure"
  elsif raw_cat == "w"
    "work"
  elsif raw_cat == "lu"
    "lunch"
  end
end

# OPEN AI DESCRIPTION GENERATION

# def description_gen(product_name)
#   OpenAI.configure do |config|
#     config.access_token = 'k-De9Wdi9Onkh1P4S9klitT3BlbkFJWCjwPV7PazrAJ4HoB2fK'
#   end

#   client = OpenAI::Client.new

#   response = client.chat(
#     parameters: {
#       model: "gpt-3.5-turbo",
#       messages: [{ role: "user", content: "Create a short description for a marketplace product that is named #{product_name}"}],
#       temperature: 0.7
#     }
#   )

#   response.dig("choices", 0, "message", "content")
# end

# SEED ITERATION

url_cd = "https://res.cloudinary.com/dtng1edik/image/list/upload.json"

url_cd_open = URI.open(url_cd).read

img_json = JSON.parse(url_cd_open)["resources"]

img_json.each do |img|
  img_public = img["public_id"]
  img_format = img["format"]
  img_url = "https://res.cloudinary.com/dtng1edik/image/upload/v1692728267/#{img_public}"
  img_file = URI.open(img_url)

  prod_cat_file = treat_name(img_public)

  product = Product.new(
    name: prod_cat_file[0],
    category: choose_cat(prod_cat_file[1]),
    description: Faker::Lorem.sentence(word_count: 20),
    # description: description_gen(prod_cat_file[0]),
    price: rand(1..5),
    user: User.first
  )
  
  product.photo.attach(io: img_file, filename: "#{prod_cat_file[2]}.#{img_format}", content_type: "image/#{img_format}")
  product.save
end
