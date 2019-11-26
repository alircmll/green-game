puts "Destroy all"

User.destroy_all
Category.destroy_all
Tip.destroy_all
Challenge.destroy_all

puts "Creating users..."
 a = User.create!(
    email:        'ali@gmail.com',
    username:     'Ali972',
    level:        5,
    total_point:  67,
    password:     'azerty',
    photo:        "https://res.cloudinary.com/deejctznc/image/upload/v1574778762/Avatar_Femme_qqmh2q.png")
 b = User.create!(
    email:        'flo@gmail.com',
    username:     'Flopaille',
    level:        2,
    total_point:  34,
    password:     'azerty',
    photo:        "https://res.cloudinary.com/deejctznc/image/upload/v1574778762/Avatar_Homme_amvbma.png")
 c = User.create!(
    email:        'lam@gmail.com',
    username:     'Lampoulpe',
    level:        4,
    total_point:  27,
    password:     'azerty',
    photo:        "https://res.cloudinary.com/deejctznc/image/upload/v1574778762/Avatar_Homme_amvbma.png")
 d = User.create!(
    email:        'xd@gmail.com',
    username:     'Xdel',
    level:        2,
    total_point:  23,
    password:     'azerty',
    photo:        "https://res.cloudinary.com/deejctznc/image/upload/v1574778762/Avatar_Homme_amvbma.png")


puts 'Finished!'


puts "Creating tips..."


tips = [
  {
    title:         "Do his own laundry",
    description:   "Make your laundry ecological: with black liquid soap, baking soda and crystals of soda",
    user:          a
  },
  {
    title:         "Eat less meat",
    description:   "Preservation of the planet, defense of animal welfare, mistrust following health scandals ... There are many good reasons to reduce our consumption of meat. But the one we do not talk about enough is the preservation of our health.",
    user:          b
  },
  {
    title:         "To travel ecologically",
    description:   "The train is the ecological transport par excellence! For example, for a 500km Paris-Amsterdam trip, a mainline train emits only 12g of CO2 / km (against 242g for the plane)",
    user:          c
  },
  {
    title:         "Buy local",
    description:   "Consume locally, so first of all make the choice of a consumption that goes in the direction of greater respect for the environment. But it's also giving local producers a chance, those just a few miles from home.",
    user:          d
  }
]

Tip.create!(tips)

puts "Finished!"


puts "Creating Categories..."

transport = Category.create!(name: "Transport")
food = Category.create!(name: "Food")
diy = Category.create!(name: "DIY")
energy = Category.create!(name: "Energy")
no_waste = Category.create!(name: "No waste")
natur_connect = Category.create!(name: "Natur connect")

puts 'Finished!'

puts "Creating Challenges..."


challenges = [
  {
    title:            "Green transport",
    duration:         7,
    step_number:      7,
    points_by_step:   15,
    description:      "Change your trip in 7 days",
    category:         transport
  },
  {
    title:            "Eat local and responsible",
    duration:         14,
    step_number:      10,
    points_by_step:   20,
    description:      "Consumers believe a product is responsible when buying it has a positive effect on the environment or society",
    category:         food
  },
  {
    title:            "Tinkering with recycling",
    duration:         7,
    step_number:      5,
    points_by_step:   10,
    description:      "The DIY : Do It Yourself",
    category:         diy
  },
  {
    title:            "Switch to renewable energies",
    duration:         100,
    step_number:      20,
    points_by_step:   50,
    description:      "Energy is qualified as renewable when it comes from resources that nature is restoring as quickly as they are consumed.",
    category:         energy
  },
  {
    title:            "Sort your garbage",
    duration:         7,
    step_number:      7,
    points_by_step:   10,
    description:      "Sorting your garbage is not rocket science! The majority of them are to be deposited in 3 kinds of bins or containers.",
    category:         no_waste
  },
  {
    title:            "Reconnect to the essentials",
    duration:         14,
    step_number:      9,
    points_by_step:   15,
    description:      "Disconnect to better reconnect to the essentials: Mother Nature",
    category:         natur_connect
  }
]

Challenge.create!(challenges)

puts "Finished!"

puts "Seed DONE"
