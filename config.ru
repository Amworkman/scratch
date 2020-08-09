require './config/environment'

  use Rack::MethodOverride
  use SessionController
  use UsersController
  use RecordContoller
  run ApplicationController

