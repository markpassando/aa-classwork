# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
user_1 = User.create({name: 'Mark', email: 'mark@mark.com', username: 'markiplier' })
user_2 = User.create({name: 'Wadah', email: 'wadah@wadah.com', username: 'wadah-fire' })
user_3 = User.create({name: 'KimK', email: 'kimk@e.com', username: 'Kim-K' })


Artwork.destroy_all
mona_lisa = Artwork.create({title: 'Mona Lisa', image_url: 'www.zzssdsawfafs.com', artist_id: user_1.id})
sistine_chapel = Artwork.create({title: 'Sistine Chapel', image_url: 'www.zoioinlmkjhs.com', artist_id: user_2.id})
mbdtf = Artwork.create({title: 'My Beautiful Dark Twisted Fantasy', image_url: 'www.mbdtf.com', artist_id: user_1.id})
tlop = Artwork.create({title: 'The life of Pablo', image_url: 'www.tlop.com', artist_id: user_2.id})

ArtworkShare.destroy_all
share_1 = ArtworkShare.create({artwork_id: tlop.id, viewer_id: user_3.id})
share_2 = ArtworkShare.create({artwork_id: tlop.id, viewer_id: user_1.id})
share_3 = ArtworkShare.create({artwork_id: mbdtf.id, viewer_id: user_2.id})
share_4 = ArtworkShare.create({artwork_id: mona_lisa.id, viewer_id: user_3.id})
