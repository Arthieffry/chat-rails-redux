Message.destroy_all
Channel.destroy_all
User.destroy_all

p "Creating channels"
channels = ["frites", "general", "ah"]
channels.each{ |channel| Channel.create!({ name: channel }) }

p "Creating Users"
users = [
  {
    email: "a@gmail.com",
    password: "123456",
    nickname: "Jackie"
  },
  {
    email: "b@gmail.com",
    password: "123456",
    nickname: "Tagada"
  },
  {
    email: "c@gmail.com",
    password: "123456",
    nickname: "Bobby"
  }
]
users.each{ |user| User.create!(user) }

p "Creating Messages"
users_created = User.all
channels_created = Channel.all

channels_created.each do |c|
  p "//// channel " + c.name
  messages = [
    {
      channel: c,
      user: users_created[0],
      content: "Bonjour"
    },
    {
      channel: c,
      user: users_created[1],
      content: "Bonjour, gros"
    },
    {
      channel: c,
      user: users_created[2],
      content: "J'aime les frites"
    },
    {
      channel: c,
      user: users_created[0],
      content: "Ah"
    }
  ]
  messages.each{ |message| Message.create!(message) }
end

p "Seeds End"
