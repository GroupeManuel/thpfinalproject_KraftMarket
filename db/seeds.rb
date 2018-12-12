# Cleaning database

User.delete_all
Category.delete_all
Item.delete_all
Order.delete_all

    # Create instances of model User
first_names = ["marcel", "olivier", "anais", "felix"]

first_names.each do |prenom|
    User.create(
        email: "#{prenom}@#{prenom}.fr", 
        password: "123456", 
        first_name: prenom.capitalize, 
        last_name: Faker::Name.last_name,
        delivery_street: Faker::Address.street_address, 
        delivery_street2: Faker::Address.secondary_address,
        delivery_city: Faker::Address.city, 
        company_name: Faker::Company.name,
        company_description:Faker::StarWars.quote, 

        )

    Cart.create(buyer_id: User.last.id)
end

    # Create 3 categories

Category.create!(category_name: "Bois")
Category.create!(category_name: "Papier")
Category.create!(category_name: "Tissu")
Category.create!(category_name: "Cuir")
Category.create!(category_name: "Autre")
 

    # Possible item and order status

item_status = ["draft", "published", "sold", "deleted"]
order_status = ["payed", "being_shipped", "shipped"]


100.times do

    # Create instances of model Item
    item = Item.create!(
        title: Faker::StarWars.character, 
        description: Faker::StarWars.quote, 
        price: rand(10..100), 
        status: item_status[rand(0..3)], 
        category_id: rand(Category.first.id..Category.last.id), 
        seller_id: rand(User.first.id..User.last.id)
        )


    # Create order if item sold
    if Item.last.status == "sold"
        Order.create!(
            buyer_id: rand(User.first.id..User.last.id),
            price: Item.last.price,
            status: order_status[rand(0..2)],
            delivery_entity: Faker::Name.name,
            delivery_street: Faker::Address.street_address,
            delivery_street2: Faker::Address.secondary_address,
            delivery_postcode: Faker::Address.postcode,
            delivery_city: Faker::Address.city,
            delivery_country: Faker::Address.country,
            delivery_instructions: Faker::StarWars.quote,
            invoice_entity: Faker::Name.name,
            invoice_street: Faker::Address.street_address,
            invoice_street2: "",
            invoice_postcode: Faker::Address.postcode,
            invoice_city: Faker::Address.city,
            invoice_country: Faker::Address.country
            )
        item.order_id = Order.last.id
        item.save
    end
 end