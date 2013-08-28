users_first_names = ["Freddy", "Ron", "Kathleen"]
users_last_names = ["Rangel", "Victorino", "Gatti"]
users_emails = ["frederick.rangel@gmail.com", "test@example.com", "test2@example.com"]
users_username = ["freddyrangel", "ronaldvictorino", "kathleengatti"]

0.upto(2) do |i|
  user = User.new(
    first_name: users_first_names[i],
    last_name: users_last_names[i],
    designation: "Nurse",
    phone: "5555555555",
    email: users_emails[i],
    password: "12345678",  
    password_confirmation: "12345678", 
    username: users_username[i]
    )
  user.save!
end

client_hcn = ["1234567890HC","1234567890HD","1234567890HS", ]
client_street = ["126 York Street", "169 Lees", "361 Elgin"]

0.upto(2) do |i|
   Client.find_or_create_by(
      first_name: users_first_names[i],
      last_name: users_last_names[i],
      date_of_birth: "1993-08-14",
      gender: "Male",
      hcn: client_hcn[i],
      physician: "Dr. Strangelove",
      physician_phone: "555-555-5555",
      diagnosis: "Diabetes",
      advanced_directives: "None",
      contact_name: "Sarah Conner",
      contact_phone: "555-555-5555",
      contact_relationship: "Mother",
      street: client_street[i],
      city: "Ottawa",
      province: "Ontario"
      )
end

1.upto(3) do |i|
  Note.find_or_create_by(
    title: "Needs vitals",
    description: "Vitals out of date.",
    user_id: 1,
    client_id: i
    )
end

1.upto(3) do |i|
  FollowUp.find_or_create_by(
    task: "Take vitals",
    user_id: 1,
    note_id: i
    )
end

1.upto(3) do |i|
  Vital.find_or_create_by(
    weight: "180",
    height: "68 inches",
    user_id: 1,
    client_id: i
    )
end

1.upto(3) do |i|
  Case.create(
    user_id: 1,
    client_id: i
    )
end