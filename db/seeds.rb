require 'rest-client'

products = RestClient.get('https://fakestoreapi.com/products')
products_array = JSON.parse(products)

lou = User.create(name: 'Lou', email: 'lou@me.com', image: 'img', google_token:'12345')

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






