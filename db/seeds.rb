Registrant.destroy_all
User.destroy_all

registrants = Registrant.create([
  { email: "bob@munat.com" },
  { email: "fred@munat.com" },
  { email: "carol@munat.com" },
  { email: "alice@munat.com" }
])

user = User.create({
  name: "Charles Munat",
  email: "chas@munat.com",
  password: "123",
  password_confirmation: "123"
})

vitaes = Vitae.create([
  {
    name: "For good jobs",
    objective: "Get a good job",
    user: user
  },
  {
    name: "For better jobs",
    objective: "Get a better job",
    user: user
  },
  {
    name: "For the best job",
    objective: "Get the best job",
    user: user
  }
])

jobs = Job.create([
  {
    company: "Bob's Sportswear",
    title: "Model",
    location: "Springfield, IL",
    hired_on: Date.new(1995, 9, 6),
    left_on: Date.new(2003, 10, 8),
    user: user,
    vitaes: [ vitaes[0], vitaes[1] ]
  },
  {
    company: "Joe's Sportswear",
    title: "Model",
    location: "Decatur, IL",
    hired_on: Date.new(2003, 10, 8),
    left_on: Date.new(2009, 1, 18),
    user: user,
    vitaes: vitaes
  },
  {
    company: "Tim's Sportswear",
    title: "Model",
    location: "Chicago, IL",
    hired_on: Date.new(2009, 1, 18),
    user: user,
    vitaes: vitaes
  }
])

schools = School.create([
  {
    name: "Harvard University",
    major: "Modeling",
    location: "Cambridge, MA",
    enrolled_on: Date.new(1991, 9, 6),
    left_on: Date.new(1995, 5, 28),
    did_graduate: true,
    user: user,
    vitaes: [ vitaes[0], vitaes[1] ]
  },
  {
    name: "MIT",
    major: "Modeling",
    location: "Cambridge, MA",
    enrolled_on: Date.new(1995, 9, 4),
    left_on: Date.new(1997, 5, 30),
    did_graduate: true,
    user: user,
    vitaes: vitaes
  }
])

refs = Ref.create([
  {
    name: "Bill Clinton",
    title: "The prez",
    email: "prez@whitehouse.com",
    phone: "212-555-1212",
    relationship: "Tormentor",
    user: user,
    vitaes: [ vitaes[0], vitaes[1] ]
  },
  {
    name: "George Bush",
    title: "The otha prez",
    email: "prez2@whitehouse.com",
    phone: "212-555-1212",
    relationship: "Frenemy",
    user: user,
    vitaes: vitaes
  }
])