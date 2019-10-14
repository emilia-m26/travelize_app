require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#rake db:migrate SINATRA_ENV=development

use TravelerController
use GoalsController 
run ApplicationController
