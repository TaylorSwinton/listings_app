#here is where I will create some seed data to work with and test associations

# Create 2 users

taylor = User.create(name: "Taylor", email: "tayloremail@gmail.com", password: "password", phone_number: "2052221094", base_address: "1234 HoneyVille Lane Birmingham, AL 34325")

sydney = User.create(name: "Sydney", email: "sydneyemail@gmail.com", password: "password", phone_number: "2051846795", base_address: "1234 Saints Blvd Vestavia, AL 34117")

#Create Home Listings

Home.create(home_address: "3821 Carabous Drive Birmingham, AL 18437", bedroom: "1", bathroom: "2",  price: "451,151.00", description: "Beautiful lake front home", user_id: taylor.id)

Home.create(home_address: "3821 Carabous Drive Birmingham, AL 18437", bedroom: "1", bathroom: "2",  price: "451,151.00", description: "Beautiful lake front home", user_id: sydney.id)