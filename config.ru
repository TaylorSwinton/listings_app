require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#in order to send patch and delete request
use Rack::MethodOverride

#here is where I mount other controllers (use)
run ApplicationController
