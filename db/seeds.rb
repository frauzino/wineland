# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create products

Product.destroy_all

Product.create(
  name: 'Blackberry and Basil Vinaigrette',
  price: 12.00,
  description: "Fraser Valley blackberries and fresh Italian Sweet Basil from Medley Organics in Oliver B.C.
    make up this delicious dressing. It has a distinct basil flavour making it ideal for a Caprese salad or just tossed
    with hot pasta for a quick meal."
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/blackberry_and_basil_vinaigrette.jpg')),
  filename: 'blackberry_and_basil_vinaigrette.jpg)'
)

Product.create(
  name: 'Blueberry Vinaigrette',
  price: 12.00,
  description: "Fraser Valley blackberries and fresh Italian Sweet Basil from Medley Organics in Oliver B.C.
    make up this delicious dressing. It has a distinct basil flavour making it ideal for a Caprese salad or just tossed
    with hot pasta for a quick meal."
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/blueberry_vinaigrette.jpg')),
  filename: 'blueberry_vinaigrette.jpg)'
)

Product.create(
  name: 'Cilantro and Lime Vinaigrette',
  price: 12.00,
  description: "The Cilantro and Lime Vinaigrette is great on salads bringing the zing of fresh cilantro with the zest
    of limes. It is also a fabulous marinade for chicken, seafood or pork and is terrific drizzled on vegetables like
    asparagus, green beans or carrots. Try it in a quinoa salad or use it to make ceviche."
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/cilantro_and_lime_vinaigrette.jpg')),
  filename: 'cilantro_and_lime_vinaigrette.jpg)'
)

Product.create(
  name: 'Fresh Herb and Garlic Vinaigrette',
  price: 12.00,
  description: "Fresh Herb and Garlic Vinaigrette is made up from fresh Italian Parsley, Cilantro, Sweet Basil and
    Marjoram. This dressing evokes the flavours of the Mediterranean and is perfect for a Greek Salad. It is also a
    great marinade for chicken, seafood or even lamb. Use it when you serve asparagus or artichokes."
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/fresh_herb_and_garlic_vinaigrette.jpg')),
  filename: 'fresh_herb_and_garlic_vinaigrette.jpg)'
)

Product.create(
  name: 'Raspberry and Black Pepper',
  price: 12.00,
  description: "Our unique raspberry vinaigrette is not sweet, the sharpness is softened with the addition of local
    honey. It is great on spinach salads, mixed greens and seafood salads. It is also very low in sodium."
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/raspberry_and_black_pepper_vinaigrette.jpg')),
  filename: 'raspberry_and_black_pepper_vinaigrette.jpg)'
)

Product.create(
  name: 'Roast Garlic Balsamic Vinaigrette',
  price: 12.00,
  description: "The  nutty mellowness of roast garlic combined with the sharp complexities of Balsamic Vinegar
    produce this highly versatile dressing. Use it on salads warm or cold, marinade any meat, seafood or vegetables.
    Stir fry with it or use it on pasta, rice or potatoes. It makes the best roast potatoes ever!"
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/roast_garlic_balsamic_vinaigrette.jpg')),
  filename: 'roast_garlic_balsamic_vinaigrette.jpg)'
)

Product.create(
  name: 'Case of 12 Assorted Vinaigrettes',
  price: 80.00,
  description: "You can mix & match your Full Case with all of our products and can order
    as many Full Cases as you'd like."
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/case_of_12.jpg')),
  filename: 'case_of_12.jpg)'
)

Product.create(
  name: '3 Bottle Variety Pack',
  price: 80.00,
  description: "You can mix & match your Variety Pack with all of our products and can order as many
    Variety Packs as you'd like."
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/variety_pack.jpg')),
  filename: 'variety_pack.jpg)'
)
