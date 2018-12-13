# Cleaning database except User

# User.delete_all
Category.delete_all
Item.delete_all
Order.delete_all

    # Create instances of model User
first_names = ["victore", "handu", "hugou", "damian"]

if User.count < 3
    then 
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
            company_description:Faker::StarWars.quote
            )

        Cart.create(buyer_id: User.last.id)
    end
end

    # Create 6 categories

Category.create!(category_name: "Bois")
Category.create!(category_name: "Papier")
Category.create!(category_name: "Tissu")
Category.create!(category_name: "Cuir")
Category.create!(category_name: "Toile-de-jute")
Category.create!(category_name: "Autre")
 

    # Possible item and order status

item_status = ["draft", "published", "sold", "deleted"]
order_status = ["payed", "being_shipped", "shipped"]

    # Create instances of model Item category bois

30.times do
    # Create instances 
    item = Item.create!(
        title: "chutes de bois - " + rand(1..15).to_s + "kg", 
        description: Faker::Lorem.paragraph, 
        price: rand(5..100), 
        status: item_status[rand(0..3)], 
        category_id: Category.last.id-5, 
        seller_id: rand(User.first.id..User.last.id),
        Faker_image: "bois"+rand(1..5).to_s+".jpg"
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

    # Create instances of model Item category papier

30.times do
    # Create instances 
    item = Item.create!(
        title: "papier " + Faker::Color.color_name, 
        description: Faker::Lorem.paragraph, 
        price: rand(5..100), 
        status: item_status[rand(0..3)], 
        category_id: Category.last.id-4, 
        seller_id: rand(User.first.id..User.last.id),
        Faker_image: "papier"+rand(1..10).to_s+".jpg"
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

    # Create instances of model Item category tissu

30.times do
    # Create instances 
    item = Item.create!(
        title: Faker::Number.number(2) + " bouts de tissu " + Faker::Color.color_name, 
        description: Faker::Lorem.paragraph, 
        price: rand(5..100), 
        status: item_status[rand(0..3)], 
        category_id: Category.last.id-3, 
        seller_id: rand(User.first.id..User.last.id),
        Faker_image: "tissu"+rand(1..7).to_s+".jpg"
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

    # Create instances of model Item category cuir

30.times do
    # Create instances 
    item = Item.create!(
        title: Faker::Number.decimal(1, 1) + "kg de cuir (chutes)", 
        description: Faker::Lorem.paragraph, 
        price: rand(5..100), 
        status: item_status[rand(0..3)], 
        category_id: Category.last.id-2, 
        seller_id: rand(User.first.id..User.last.id),
        Faker_image: "cuir"+rand(1..7).to_s+".jpg"
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

    # Create instances of model Item category toile de jute

30.times do
    # Create instances 
    item = Item.create!(
        title: "sac de café - " + Faker::Coffee.origin, 
        description: Faker::Lorem.paragraph, 
        price: rand(5..100), 
        status: item_status[rand(0..3)], 
        category_id: Category.last.id-1, 
        seller_id: rand(User.first.id..User.last.id),
        Faker_image: "jute"+rand(1..16).to_s+".jpg"
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
