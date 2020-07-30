require './config/environment'

  use Rack::MethodOverride
  use RecordContoller
  use ArtistController
  use LabelController
  run ApplicationController

