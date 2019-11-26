puts 'Destroy All'

User.destroy_all
Tips.destroy_all

puts "Creating users..."
 a = User.create!(
    username:     'Ali972',
    email:        'ali@gmail.com',
    address:      '9 rue Courbin, 33000 Bordeaux',
    password:     'azerty',
    hugger:        false,
    photo: "IMG_0319_grrvbs")
