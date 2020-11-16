require "rest-client"
require "json"

Cosmetic.delete_all
AdminUser.delete_all

url = "https://fortnite-api.com/v2/cosmetics/br"
response = RestClient.get(url)
cosmetics = JSON.parse(response.body.to_s)

cosmetics["data"].each do |cosmetic|
  cosmetic.inspect
  Cosmetic.create(
    name:        cosmetic["name"],
    description: cosmetic["description"],
    item_type:   cosmetic["type"] ["value"],
    rarity:      cosmetic["rarity"]["value"]
    # image:       cosmetic["images"] ["smallIcon"]
  )
end

# puts "there was #{Cosmetic.count} made"

if Rails.env.development?
  AdminUser.create!(email:                 "admin@example.com",
                    password:              "password",
                    password_confirmation: "password")
end
