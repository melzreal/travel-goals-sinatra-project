require './config/environment'



use Rack::MethodOverride
use UsersController 
use HolidaysController
run ApplicationController