# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = [
  {
    email: "admin@admin.com",
    password: "abc12345",
    password_confirmation: "abc12345"
  }
]

customers = [
  {
    first_name: "John",
    last_name: "Doe",
    phone: "(12)34567-8901",
    address: "1234 Main St, Anytown, USA"
  },
  {
    first_name: "Jane",
    last_name: "Doe",
    phone: "(12)34567-8902",
    address: "1234 Main St, Anytown, USA"
  }
]

pizzas = [
  {
    name: "Pepperoni Pizza",
    description: "Pepperoni pizza with mozzarella cheese",
    code: "pepperoni",
    price: 10.99
  },
  {
    name: "Cheese Pizza",
    description: "Cheese pizza with mozzarella cheese",
    code: "cheese",
    price: 9.99
  },
  {
    name: "Veggie Pizza",
    description: "Veggie pizza with mushrooms, onions, and peppers",
    code: "veggie",
    price: 11.99
  }
]

users.each { |user| AdminUser.create(user) }
customers.each { |customer| Customer.create(customer) }
pizzas.each { |pizza| Pizza.create(pizza) }