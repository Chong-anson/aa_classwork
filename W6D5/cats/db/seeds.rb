# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CatRentalRequest.destroy_all
Cat.destroy_all

c1 = Cat.create(birth_date: "2011/01/02", color: "white", name: "abc", sex: "M", description: "asdlkjf")
c2 = Cat.create(birth_date: "2010/01/02", color: "brown", name: "def", sex: "F", description: "asdlkjf")
c3 = Cat.create(birth_date: "2011/01/02", color: "black", name: "hij", sex: "M", description: "asdlkjf")
c4 = Cat.create(birth_date: "2011/01/02", color: "white", name: "mnq", sex: "M", description: "asdlkjf")
c5 = Cat.create(birth_date: "2011/01/02", color: "white", name: "opk", sex: "F", description: "asdlkjf")
c6 = Cat.create(birth_date: "2011/01/02", color: "white", name: "lmn", sex: "F", description: "asdlkjf")
