class Client < ActiveRecord::Base
	has_many :users
	has_many :notes
	has_many :vitals

  date_of_birth =
   {"name"=>"Birthday",
    "date(1i)"=>"2012",
    "date(2i)"=>"11",
    "date(3i)"=>"28"}
  date = Date.new date_of_birth["date(1i)"].to_i, date_of_birth["date(2i)"].to_i, date_of_birth["date(3i)"].to_i
end
