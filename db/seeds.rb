# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

namespace :db do
   desc "Load seed fixtures (from spec/fixtures) into the current environment's database."
   task :seed => :environment do
      require 'active_record/fixtures'
      Dir.glob(RAILS_ROOT + '/tmp/db/*.{yml,csv}').each do |file|
         Fixtures.create_fixtures('tmp/db', File.basename(file, '.*'))
         puts "Running data fixture #{file}"
      end
   end
end
