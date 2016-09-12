# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


200.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@4dandies.com"
  avatar_array= ["http://i.imgur.com/Ssizhd5.jpg", "http://i.imgur.com/U80XJcA.jpg", "http://i.imgur.com/g0kJYA2.jpg", "http://i.imgur.com/PdECln1.jpg", "http://boblongblog.altervista.org/blog/wp-content/uploads/2016/02/Emily-Ratajkowski-REVOLVE-Summer-Ads04-800x480.jpg",
  "http://cdn-img.instyle.com/sites/default/files/styles/320x384/public/images/2015/07/073115-jennifer-lawrence-and-amy-schumer2.jpg?itok=i8lqBvbs",
  "http://a2.files.biography.com/image/upload/c_fill,cs_srgb,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2MzUyMzgyNDc1.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/f/f5/Steve_Jobs_Headshot_2010-CROP2.jpg",
  "http://www.earwolf.com/wp-content/uploads/2011/04/Screen-shot-2015-09-09-at-4.22.23-PM-300x270.png",
  "http://vignette2.wikia.nocookie.net/bigbangtheory/images/d/de/Dr_sheldon_cooper.jpg/revision/latest?cb=20120314055518",
  "https://studiosol-a.akamaihd.net/letras/338x298/fotos/8/0/e/6/80e6a739bfa0f693b8ed64aca9643877.jpg",
  "https://instagram.flis1-1.fna.fbcdn.net/t51.2885-19/s150x150/13734304_288676411495256_393627284_a.jpg",
  "https://pbs.twimg.com/profile_images/558109954561679360/j1f9DiJi.jpeg",
  "http://cdn.jornaldenegocios.pt/2012-08/img_890x500$2012_08_01_15_09_24_183663.jpg",
  "http://dioguinho.pt/wp-content/uploads/2014/09/QzEckSX.png",
  "http://classyceleb.com/wp-content/uploads/2016/07/6-41.jpg",
  "http://i150.photobucket.com/albums/s81/Kool-T/My%20Way%204%20Sho/lisa_ann.jpg",
  "https://www.fraudswatch.com/wp-content/uploads/2015/08/Mia-Khalifa-14-1.jpg"]
  image=avatar_array.shuffle.sample
  User.create!(name: name,
               email: email,
               image_url: image)
end