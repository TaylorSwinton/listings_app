#here is where I will create some seed data to work with and test associations

# Create 2 users

taylor = User.create(name: "Taylor", email: "tayloremail@gmail.com", password: "password", phone_number: "2052221094", base_address: "1234 HoneyVille Lane Birmingham, AL 34325")

sydney = User.create(name: "Sydney", email: "sydneyemail@gmail.com", password: "password", phone_number: "2051846795", base_address: "1234 Saints Blvd Vestavia, AL 34117")

#Create Home Listings

Home.create(home_address: "3821 Carabous Drive Birmingham, AL 18437", bedroom: "1", bathroom: "2",  price: "451,151.00", description: "Beautiful lake front home", user_id: taylor.id)

Home.create(home_address: "3821 killer ave, AL 18437", bedroom: "5", bathroom: "6",  price: "841,151.00", description: "Spacious ivy mansion", user_id: sydney.id)

#OR YOU CAN DO IT THE WAY BELOW!!!
#Use AR to pre-associate data:

#howard.Home.create(home_address: "3821 Carabous Drive Birmingham, AL #18437", bedroom: "1", bathroom: "2",  price: "451,151.00", description: #"Beautiful lake front home")

#sydneys_home = sydney.homes.build(home_address: "4513 Laughet Blvd Hoover, AL 4183", bedroom: "4", bathroom: "5",  price: "841,151.00", description: "Spacious ivy mansion")
#sydneys_home.save #build doesn't automatically save to the db!