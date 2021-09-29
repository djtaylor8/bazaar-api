require 'rest-client'

products = RestClient.get('https://fakestoreapi.com/products')
products_array = JSON.parse(products)

lou = User.create(name: 'Lou', username: 'lou', email: 'lou@me.com', street_address: '545 S. Euclid Avenue', city: 'Pasadena', zipcode: 91101)

products_array.each do |product| 
    Product.create!(
        name: product["title"],
        description: product["description"],
        listing_type: 'sell',
        price: product["price"],
        total_available: 10,
        image: product["image"],
        user: lou
    )
end




