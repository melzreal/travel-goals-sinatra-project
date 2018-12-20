Travel goals CMS App - A small project bringing together routes, forms and notes. Consists of an MVC Sinatra Application using ActiveRecord.


Run rake:db seed to insert all countries into your database.


Allows users to register, choose from a list of visited countries and manually add visited town or city.
Users can edit holidays to add notes about their visit, delete holidays and delete countries from holidays.

Each town or city that the user adds will also have a form to add notes about the visit.





Checklist done:

- [x] Models and databases created, countries seeded
- [x] Users can register, login, logout
- [x] Users can create holidays with a name and associated countries.
- [x] Users can view holidays/ countries and click on them
- [x] Prevent users from deleting holidays that were not created by that user
- [x] Added ability to delete countries 



To do:
- [ ] Add edit forms to add notes to each country and patch methods
- [ ] Add secure authentication (currently session secret is set to secret)
- [ ] Prevent users from deleting countries not associated to that user via holidays
- [ ] Add flash messages to request logins and display errors


Look to this space for updates. 

Mel