Van.destroy_all
User.destroy_all

user1 = User.create(first_name: 'John', last_name: 'Smith', email: 'john@gmail.com', password: 'password')
user2 = User.create(first_name: 'Alicia', last_name: 'Smith', email: 'alicia@gmail.com', password: 'password')
user3 = User.create(first_name: 'Mary', last_name: 'Smith', email: 'mary@gmail.com', password: 'password')


van1 = Van.create(brand: 'Volkswagen', model: 'California', price: 60000, address: '5333 Ave Casgrain, Montreal', user_id: user1.id)
van2 = Van.create(brand: 'Mercedes', model: 'Marco Polo', price: 100000, address: '6524 Rue Bordeaux, Montreal', user_id: user2.id)
van3 = Van.create(brand: 'Nissan', model: 'NV Camper', price: 70000, address: '7643 Ave Henri-Julien, Montreal', user_id: user3.id)
