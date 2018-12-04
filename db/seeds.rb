# Cleaning database

User.destroy_all
Category.destroy_all
Item.destroy_all
Order.destroy_all

    # Create instances of model User

User.create!(email: "victor@victor.fr", password: "123456")
User.create!(email: "hugo@hugo.fr", password: "123456")
User.create!(email: "handa@handa.fr", password: "123456")
User.create!(email: "damien@damien.fr", password: "123456")

    # Create 3 categories

Category.create!(category_name: "Bois")
Category.create!(category_name: "Papier")
Category.create!(category_name: "Tissu")


    # Possible item and order status

item_status = ["draft", "published", "sold", "deleted"]
order_status = ["payed", "being_shipped", "shipped"]


100.times do 

    # Create instances of model Item

    Item.create!(
        title: Faker::StarWars.character, 
        description: Faker::StarWars.quote, 
        price: rand(10..100), 
        status: item_status[rand(0..3)], 
        category_id: rand(Category.first.id..Category.last.id), 
        seller_id: rand(User.first.id..User.last.id)
        )

    # Create instances of model Order if item sold

    if Item.last.status == "sold" 
        Order.create!(
            item_id: Item.last.id,
            buyer_id: rand(User.first.id..User.last.id),
            price: Item.last.price,
            status: order_status[rand(0..2)],
            delivery_entity: Faker::Name.name,
            delivery_street: Faker::Address.street_address,
            delivery_street2: Faker::Address.secondary_address,
            delivery_postcode: Faker::Address.postcode,
            delivery_city: Faker::Address.city,
            delivery_country: Faker::Address.country,
            delivery_state: Faker::Address.state,
            delivery_instructions: Faker::StarWars.quote,
            invoice_entity: Faker::Name.name,
            invoice_street: Faker::Address.street_address,
            invoice_street2: "",
            invoice_postcode: Faker::Address.postcode,
            invoice_city: Faker::Address.city,
            invoice_country: Faker::Address.country,
            invoice_state: Faker::Address.state,
            )
    end
end