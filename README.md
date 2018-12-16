Travel goals CMS App - A small project bringing together routes, forms and notes. Consists of an MVC Sinatra Application using ActiveRecord.


Run rake:db seed to insert all countries into your database.


Allows users to register, choose from a list of visited countries and manually add visited town or city. Each town or city that the user adds will also have a form to add notes about the visit.

The only edits allowed on country are delete, you cannot edit a country.
You can edit a city visited.



Our models:

User:      has_many holidays
		   has_secure_password 

Holidays   belongs_to user
           has many countries through holiday_countries

Countries  has_many cities 
		   has many holidays through  holiday_countries


Cities     belongs_to countries

Look to this space for updates. 

Mel