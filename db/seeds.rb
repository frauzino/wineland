# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Product.destroy_all
# Retailer.destroy_all
# Market.destroy_all
# User.destroy_all
# Order.destroy_all

OrderItem.destroy_all
Order.destroy_all
CartItem.destroy_all
Cart.destroy_all
Product.destroy_all
Retailer.destroy_all
Market.destroy_all
User.destroy_all

# Create Admin User

puts 'Creating admin user...'

User.create(
  email: 'admin@admin.com',
  password: 'secret',
  password_confirmation: 'secret',
  admin: true
)

puts 'Admin user created!'

# Create Retailer User

puts 'Creating retailer user...'

User.create(
  email: 'test@test.com',
  password: 'secret',
  password_confirmation: 'secret'
)

puts 'Retailer user created!'

# Create Markets

puts 'Creating markets...'

Market.create(
  name: 'Kelowna Farmers Market',
  description: 'The Kelowna Farmers Market is a market that features farm fresh produce, locally made crafts, and delicious food.',
  address: '1992 Dilworth Dr',
  start_date_time: '2024-10-10 08:00:00',
  end_date_time: '2024-10-10 13:00:00'
)

Market.create(
  name: 'Penticton Farmers Market',
  description: 'The Penticton Farmers Market is a market that features farm fresh produce, locally made crafts, and delicious food.',
  address: '100 Main St',
  start_date_time: '2024-06-05 08:00:00',
  end_date_time: '2024-06-05 13:00:00'
)

puts 'Markets created!'

# Create products

puts 'Creating products... and attaching images from app/assets/images/...'

Product.create(
  name: 'Blackberry and Basil Vinaigrette',
  price: 12.00,
  description: 'Fraser Valley blackberries and fresh Italian Sweet Basil from Medley Organics in Oliver B.C.
    make up this delicious dressing. It has a distinct basil flavour making it ideal for a Caprese salad or just tossed
    with hot pasta for a quick meal.'
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/blackberry_and_basil_vinaigrette.jpg')),
  filename: 'blackberry_and_basil_vinaigrette.jpg)'
)

Product.create(
  name: 'Blueberry Vinaigrette',
  price: 12.00,
  description: 'Fraser Valley blackberries and fresh Italian Sweet Basil from Medley Organics in Oliver B.C.
    make up this delicious dressing. It has a distinct basil flavour making it ideal for a Caprese salad or just tossed
    with hot pasta for a quick meal.'
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/blueberry_vinaigrette.jpg')),
  filename: 'blueberry_vinaigrette.jpg)'
)

Product.create(
  name: 'Cilantro and Lime Vinaigrette',
  price: 12.00,
  description: 'The Cilantro and Lime Vinaigrette is great on salads bringing the zing of fresh cilantro with the zest
    of limes. It is also a fabulous marinade for chicken, seafood or pork and is terrific drizzled on vegetables like
    asparagus, green beans or carrots. Try it in a quinoa salad or use it to make ceviche.'
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/cilantro_and_lime_vinaigrette.jpg')),
  filename: 'cilantro_and_lime_vinaigrette.jpg)'
)

Product.create(
  name: 'Fresh Herb and Garlic Vinaigrette',
  price: 12.00,
  description: 'Fresh Herb and Garlic Vinaigrette is made up from fresh Italian Parsley, Cilantro, Sweet Basil and
    Marjoram. This dressing evokes the flavours of the Mediterranean and is perfect for a Greek Salad. It is also a
    great marinade for chicken, seafood or even lamb. Use it when you serve asparagus or artichokes.'
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/fresh_herb_and_garlic_vinaigrette.jpg')),
  filename: 'fresh_herb_and_garlic_vinaigrette.jpg)'
)

Product.create(
  name: 'Raspberry and Black Pepper',
  price: 12.00,
  description: 'Our unique raspberry vinaigrette is not sweet, the sharpness is softened with the addition of local
    honey. It is great on spinach salads, mixed greens and seafood salads. It is also very low in sodium.'
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/raspberry_and_black_pepper_vinaigrette.jpg')),
  filename: 'raspberry_and_black_pepper_vinaigrette.jpg)'
)

Product.create(
  name: 'Roast Garlic Balsamic Vinaigrette',
  price: 12.00,
  description: 'The  nutty mellowness of roast garlic combined with the sharp complexities of Balsamic Vinegar
    produce this highly versatile dressing. Use it on salads warm or cold, marinade any meat, seafood or vegetables.
    Stir fry with it or use it on pasta, rice or potatoes. It makes the best roast potatoes ever!'
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/roast_garlic_balsamic_vinaigrette.jpg')),
  filename: 'roast_garlic_balsamic_vinaigrette.jpg)'
)

Product.create(
  name: 'Case of 12 Assorted Vinaigrettes',
  price: 80.00,
  assortable: true,
  description: "You can mix & match your Full Case with all of our products and can order
    as many Full Cases as you'd like."
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/case_of_12.jpg')),
  filename: 'case_of_12.jpg)'
)

Product.create(
  name: '3 Bottle Variety Pack',
  price: 23.00,
  assortable: true,
  description: "You can mix & match your Variety Pack with all of our products and can order as many
    Variety Packs as you'd like."
)

Product.last.image.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/variety_pack.jpg')),
  filename: 'variety_pack.jpg)'
)

puts 'Products created!'

puts 'Creating retailers...'

bc_items = [
  { header: "Penticton",
    content: "Save On Foods - 2111 Main St
              The Bench Market - 368 Vancouver Ave
              Buy The Sea - 103-300 Riverside Dr
              LocalMotive - 1848 Main St,
              South Main Market - 3010 S Main St,
              B.C. Wine Information Centre - 553 Vees Dr
              IGA - 1160 Government St" },
  { header: "Naramata",
    content: "Deep Roots Winery - 884 Tiller rd
              Naramata Store - 225 Robinson ave " },
  { header: "Summerland",
    content: "Little Acre Fruit Stand - 11608 Dale Meadows Rd
              Artisans of the Okanagan - 13229 Henry Ave
              Blossoms Fruit Stand - 5408 Hwy 97
              Summerland Sweets - 6206 Canyon View Rd " },
  { header: "Kelowna",
    content: "Save On Foods - 3175 Lakeshore Rd
              Save On Foods - 1876 Cooper Road
              Urban Fare - 3155 Lakeshore Rd
              Seedlings Fruit Stand - 3254 McCulloch Rd
              Kelowna Fruit Stand - 5225 Hwy 97 N
              Sunshine Market - 4600 Lakeshore Drive
              KLO Farm Market - 1760 KLO Rd
              "},
  { header: "West Kelowna",
    content: "Buy The Sea - 2231 Louie Dr"},
  { header: "Winfield",
    content: "Hayat Fruit Stand - 11938 Oceola Rd"},
  { header: "Oyama",
    content: "Gatzkey's Orchard - 15686 Pelmewash Parkway"},
  { header: "Kaledan",
    content: "Farm Gate Winery - 346 Hwy 97 S
              Doug's Homestead - 224 Hwy 97 S"},
  { header: "Okanagan Falls",
    content: "Tickleberry's - Hwy 97"},
  { header: "Oliver",
    content: "Hester Creek Winery - 877 Rd 8
              Oliver Supermarket - 33459 101 St
              Oliver Garden Centre - 5555 Hwy 97
              The Fruit Cart - 5536 Hwy 97
              Sunview Market - Hwy 97
              Nature's Basket Fruit Market - 5535 Hwy 97
              Aujla Farm Market - 4383 Hwy 97"},
  { header: "Hedley",
    content: "Hedley Country Market - 897 Scott Ave"},
  { header: "Keremeos",
    content: "Bear's Fruit Market - 991 Keremeos Bypass Rd
              Sanderson Farms - 3059 Hwy 3
              Mariposa Fruit Stand - 3125 Hwy 3
              Lasser Produce - 601 Hwy 3A
              Parson's Fruit Stand - 110 7th Ave
              Mom & Pop's Fruit Market - 230 7th Ave
              Peach King Fruit Market - 990 Keremeos Bypass Rd"},
  { header: "Cawston",
    content: "Rustic Roots Winery - 2238 Hwy 3
              Cawston Country Farm - 1918 Hwy 3"},
  { header: "Osooyos",
    content: "Kailey Fruit Market - 8800 Meadowlark Dr
              Osooyos Fruit Basket - 9910 Crowsnest Hwy
              Orchard Hill Cidery and Fruit Market - 3480 Fruitvale Way
              Saran Fruit Market - 4181 Hwy 97
              Peach Hill Farm Market - 9105 Hwy 97"},
  { header: "Creston",
    content: "Paul's Superette - 2005 Canyon St"},
  { header: "Castlegar",
    content: "Kootenay Market - 635 Columbia Ave"},
  { header: "Cranbrook",
    content: "Nutter's Bulk & Natural Foods - 1107 Baker St"},
  { header: "Vernon",
    content: "Briteland - 3208 28th St
              Davison Orchards - 3111 Davison"},
  { header: "Kamloops",
    content: "Save On Foods - 1210 Summit Dr
              Save On Foods - 2101 East Trans Canada Hwy"},
  { header: "Salmon Arm",
    content: "DeMille's Farm Market - 3710 Trans Canada Hwy"},
  { header: "Armstrong",
    content: "The Log Barn - 1912 Hwy 97 N"},
  { header: "Enderby",
    content: "Enderby Country Store - 702 Russell Ave"},
  { header: "Grindrod",
    content: "Farmer John's - 15 Grandview Bench Rd"},
  { header: "Revelstoke",
    content: "Le Marche Gourmet - 607 Victoria Rd"},
  { header: "Spillimacheen",
    content: "Beelend Market - 976 Hwy 95"},
  { header: "Windermere",
    content: "Hopkin's Harvest - 1645 Hwy 95"},
  { header: "Fernie",
    content: "Wildsight Elk Valley - 632 2nd Ave"},
  { header: "Kimerley",
    content: "Meat Matters - 417a 304 St"},
  { header: "Vancouver",
    content: "Farm To Table Market - 1312 Richards St
              Parthenon Supermarket - 3089 W Broadway
              Sungiven Foods - 555 W 12th Ave
              IGA - 909 Burrard St
              IGA - 489 Robson St"},
  { header: "West Vancouver",
    content: "Fresh St. Market - 1650 Marine Dr
              IGA - 2491 Marine Dr"},
  { header: "North Vancouver",
    content: "Foxy Farm Market - 108 W 1st St
              End Of The Line General Store - 4193 Lynn Valley Rd
              Sungiven Foods - 1595 Marine Dr
              Save On Foods - 1250 Marine Dr"},
  { header: "Burnaby",
    content: "Sungiven Foods - 577 MarineWay"},
  { header: "Port Coquitlam",
    content: "City Avenue Market - 2527 Shaughnessy St"},
  { header: "New Westminster",
    content: "City Avenue Market - 810 Quayside Dr"},
  { header: "Port Moody",
    content: "The Little Butcher - 245 Newport Dr
              Eden West Gourmet - 96 Kyle St"},
  { header: "Maple Ridge",
    content: "Save On Foods - 20395 Lougheed Hwy
              Bruce's Country Market - 23963 Lougheed Hwy
              Golden Ears Cheesecrafters - 22270 128th Ave
              Eden West Gourmet - 96 Kyle St"},
  { header: "Pitt Meadows",
    content: "Hoppcott Premium Meats - 18385 Old Dewdney Trunk Rd"},
  { header: "Langley",
    content: "Moreno's Market - 7150 200 St
              Fresh St. Market - 20159 88th Ave
              Heritage Meats - 19689 Willowbrook Dr
              IGA - 2110 200th St
              The Local Space - 20497 Fraser Hwy
              Dreidiger Farms - 23823 72nd Ave"},
  { header: "Abbotsford",
    content: "Nature's Pickin's - 1356 Sumas Way
              Lepp Farm Market - 33955 Clayburn Rd
              Local Food Supply Co. - 2581 Railway St"},
  { header: "Aldergrove",
    content: "Save On Foods - 26310 Fraser Hwy"},
  { header: "Chilliwack",
    content: "Hofstede's Country Barn - 46796 Luckakuck way
              Produce Gone Wild - 45735 Alexander Ave
              Produce Gone Wild - 7481 Vedder Rd"},
  { header: "Delta",
    content: "Save On Foods - 5186 48th Ave
              Vandula Farms - 9832 Ladner Trunk Rd"},
  { header: "Surrey",
    content: "Save On Foods - 3301 152nd St
              Sungiven Foods - 1640 152nd St
              Fresh St. Market - 15930 Fraser Hwy
              Fresh St. Market - 15127 BC-10
              Cloverdale Country Market - 18385 Old Dewdney Trunk Rd
              Mary's garden - 15649 40th Ave
              Rondriso Farms - 8390 172nd St"},
  { header: "Richmond",
    content: "The Fowl Farmer - 15481 Cambie Rd
              Sungiven Foods - 9771 Bridgeport Rd"},
  { header: "Ladner",
    content: "Superior Fish - 5229 Ladner Trunk Rd"},
  { header: "White Rock",
    content: "Save On Foods - 1641 210 St"},
  { header: "Squamish",
    content: "Save On Foods - 1301 Pemberton Ave"},
  { header: "Pemberton",
    content: "Pemberton Valley Supermarket - 7438 Prospect St
              North Arm Farm - 1888 Sea To Sky Hwy
              Mile One Eating House - 7330 Arbutus St"},
  { header: "Prince George",
    content: "Save On Foods - 3885 W Austin Rd
              Save On Foods - 5232 Domano Blvd
              Save On Foods - 1600 15th Ave
              Save On Foods - 555 Central St"},
  { header: "Vanderhoof",
    content: "Bacchus Vine Creations - 149 Stewart St"},
  { header: "Smithers",
    content: "Safeway - 3664 Hwy 16"},
  { header: "Victoria",
    content: "Sun Wing Tomato Farm - 6070 Oldfield Rd
              Red Barn Market - 5550 West Saanich Rd
              Red Barn Market - 662 Brookside Rd
              Red Barn Market - 1933 Oak Bay Ave
              Red Barn Market - 1310 Esquimalt Rd
              Red Barn Market - 325 Menzies St
              Save On Foods - 172 Wilson St
              The Market Garden - 810 Catherine St
              Local General Store - 1440 Haultain St
              Metchosin Country Store - 4384 Metchosin Rd"},
  { header: "Saanich",
    content: "Save On Foods - 3510 Blanshard St"},
  { header: "Saanichton",
    content: "Spirals Gourmetware - 1885 Haldon Rd
              Firbank Farm - 2834 Island View Rd"},
  { header: "North Saanich",
    content: "Deep Cove Market - 10940 W Saanich Rd"},
  { header: "Brentwood Bay",
    content: "Woodwynn Farms - 1189 West Saanich Rd"},
  { header: "Mill Bay",
    content: "Sweet Meadows Market - 2957 Church Way"},
  { header: "Pender Island",
    content: "Southridge Country Store - 3327 Port Washington Rd"},
  { header: "Nanaimo",
    content: "Nesvog Meats - 2139 Bowen Rd"},
  { header: "Duncan",
    content: "Great Greens Farm Market - 11485 Trans Canada Hwy"},
  { header: "Parksville",
    content: "Little Qualicum Cheeseworks - 403 Lowrys Rd"},
  { header: "Qualicum Beach",
    content: "Meat Craft Qualicum Butchery - 680 Berwick Rd S"},
  { header: "Hornby Island",
    content: "Hornby Island Co-op - 5875 Central Rd"},
  { header: "Campbell River",
    content: "Smith & Lee Butchers - 1270 Central Rd
              Willow's Market - 2266 South Island Hwy"},
  { header: "Ucluelet",
    content: "Blackberry Cove Market - 243 Main St"},
  { header: "North Saanich",
    content: "Deep Cove Market - 10940 W Saanich Rd"},
  { header: "Gibon's Landing",
    content: "IGA - 100 Highway 101
              Shaggy Jack's Market - 473 Gower Point Rd"},
  { header: "Madeira Park",
    content: "IGA - 12887 Madeira Park Rd"},
  { header: "Seschelt",
    content: "IGA - 4330 Sunshine Coast Hwy"},
  { header: "Port McNeill",
    content: "IGA - 1705 Campbell Way"},
  { header: "Shirley",
    content: "Stoked Wood Fired Pizzeria and Market - 2908 Tieulie Rd"},
]

bc_items.each do |item|
  item[:content].split("\n").each do |retailer|
    Retailer.create(
      name: retailer.split(' - ').first,
      address: retailer.split(' - ').last,
      city: item[:header],
      region: 'British Columbia'
    )
  end
end

ab_items = [
  { header: 'Calgary',
    content: 'The Crisp Apple Fruit and Vegetable Shot - 11520 24th St' },
  { header: 'Edmonton',
    content: 'Freson Bros - 5139 Mullen Rd NW
              Italian Centre Shop - 5028 104a St NW' },
  { header: 'Lundbreck',
    content: 'Lundbreck Trading Co - 101 Breckinridge Ave' },
  { header: 'High River',
    content: 'Emerson Lane Mercantile - 103 3rd Ave' }
]

ab_items.each do |item|
  item[:content].split("\n").each do |retailer|
    Retailer.create(
      name: retailer.split(' - ').first,
      address: retailer.split(' - ').last,
      city: item[:header],
      region: 'Alberta'
    )
  end
end

sk_items = [
  { header: "Emerald Park",
    content: "TWB Home Decor - 36 Great Plains Rd" },
  { header: "Saskatoon",
    content: "Pitch Fork Market - 3020 Meadows Parkway" }
]

sk_items.each do |item|
  item[:content].split("\n").each do |retailer|
    Retailer.create(
      name: retailer.split(' - ').first,
      address: retailer.split(' - ').last,
      city: item[:header],
      region: 'Saskatchewan'
    )
  end
end

mb_items = [
  { header: "Winnipeg",
    content: "Miller's Meats - 1867 Grant Ave" }
]

mb_items.each do |item|
  item[:content].split("\n").each do |retailer|
    Retailer.create(
      name: retailer.split(' - ').first,
      address: retailer.split(' - ').last,
      city: item[:header],
      region: 'Manitoba'
    )
  end
end

puts 'Retailers created!'
