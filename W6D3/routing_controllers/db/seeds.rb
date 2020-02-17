# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

# USERS

u1 = User.create({username: 'africalochsa'})
u2 = User.create({username: 'overratemeson'})
u3 = User.create({username: 'mosedalecatena'})
u4 = User.create({username: 'droppingafar'})
u5 = User.create({username: 'dashboardbobsled'})

# ARTWORKS
a1 = Artwork.create({title: 'Seascape Bold', image_url: 'https://images.fineartamerica.com/images-medium-large-5/abstract-art-landscape-seascape-bold-colorful-artwork-serenity-by-madart-megan-duncanson.jpg', artist_id: u1.id})
a2 = Artwork.create({title: 'Colorful Whimsical', image_url: 'https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/1-colorful-whimsical-pop-art-style-heart-painting-unique-artwork-by-megan-duncanson-megan-duncanson.jpg', artist_id: u1.id})
a3 = Artwork.create({title: 'Rainbowhead', image_url: 'http://cdn.shopify.com/s/files/1/0073/2452/products/AaronJasinski_IdiotBox2018_grande.jpg?v=1571438856', artist_id: u2.id})
a4 = Artwork.create({title: 'Pyschedelic Alien', image_url: 'http://g02.a.alicdn.com/kf/HTB19SPvLVXXXXaXXFXXq6xXFXXXN/220214817/HTB19SPvLVXXXXaXXFXXq6xXFXXXN.jpg', artist_id: u2.id})
a5 = Artwork.create({title: 'Arts Elevated', image_url: 'https://flyrst.com/wp-content/uploads/2019/11/art-test.jpg', artist_id: u3.id})

# ARTWORK SHARES
s1 = ArtworkShare.create(artwork_id: a1.id, view_id: u5.id)
s2 = ArtworkShare.create(artwork_id: a1.id, view_id: u4.id)
s3 = ArtworkShare.create(artwork_id: a2.id, view_id: u3.id)
s4 = ArtworkShare.create(artwork_id: a4.id, view_id: u1.id)
s5 = ArtworkShare.create(artwork_id: a5.id, view_id: u1.id)