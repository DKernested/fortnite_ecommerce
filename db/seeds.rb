require "rest-client"
require "json"

Cosmetic.delete_all
AdminUser.delete_all
Category.delete_all

url = "https://fortnite-api.com/v2/cosmetics/br"
response = RestClient.get(url)
cosmetics = JSON.parse(response.body.to_s)

cosmetics["data"].each do |cosmetic|
  category = Category.find_or_create_by(name: cosmetic["type"]["value"])
  puts category.errors.messages # put on line 13
  next unless category&.valid?

  cosmetic_entry = category.cosmetics.create(
    name:        cosmetic["name"],
    description: cosmetic["description"],
    item_type:   cosmetic["type"] ["value"],
    rarity:      cosmetic["rarity"]["value"]
    # image:       cosmetic["images"] ["smallIcon"]
  )
  puts cosmetic_entry.errors.messages
end

if Rails.env.development?
  AdminUser.create!(email:                 "admin@example.com",
                    password:              "password",
                    password_confirmation: "password")
end
puts "created #{Cosmetic.count} cosmetics"
puts "created #{Category.count} categories"
