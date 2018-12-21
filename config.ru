require './config/environment'



use Rack::MethodOverride
use UsersController 
use HolidaysController
use HolidaysCountryController
run ApplicationController