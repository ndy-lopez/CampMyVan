User.destroy_all

User.create(first_name: 'John', last_name: 'Smith', email: 'john@gmail.com', password: 'password')
User.create(first_name: 'Alicia', last_name: 'Smith', email: 'alicia@gmail.com', password: 'password')
User.create(first_name: 'Mary', last_name: 'Smith', email: 'mary@gmail.com', password: 'password')


Van.create(brand: 'Volkswagen', model: 'California', price: 60000)
Van.create(brand: 'Mercedes', model: 'Marco Polo', price: 100000)
Van.create(brand: 'Nissan', model: 'NV Camper', price: 70000)
