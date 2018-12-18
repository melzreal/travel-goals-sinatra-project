Travel goals CMS App - A small project bringing together routes, forms and notes. Consists of an MVC Sinatra Application using ActiveRecord.


Run rake:db seed to insert all countries into your database.


Allows users to register, choose from a list of visited countries and manually add visited town or city. Each town or city that the user adds will also have a form to add notes about the visit.

The only edits allowed on country are delete, you cannot edit a country.
You can edit a city visited.



Checklist done:

- [x] Models and databases created, countries seeded
- [x] Users can register, login, logout
- [x] Users can create holidays with a name and associated countries.
- [x] Users can view holidays/ countries and click on them


To do:
- [ ] Add edit forms to add notes to each country
- [ ] Add ability to delete countries 
- [ ] Add secure authentication (currently session secret is set to secret)
- [ ] Prevent other users from modifying content that was not created by that user
- [ ] Add flash messages to request logins and display errors


Look to this space for updates. 

Mel