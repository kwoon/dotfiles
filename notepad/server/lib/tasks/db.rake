require 'sequel'
require 'active_support/all'

namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |t, args|
    Sequel.extension :migration
    if args[:version]
      puts 'Migrating to version #{args[:version]}'
      Sequel::Migrator.apply(DB, 'db/migrations', target: args[:version].to_i)
    else
      puts 'Migrating to latest'
      Sequel::Migrator.apply(DB, 'db/migrations')
    end
  end

  desc 'Generate database migration'
  task :gen_migration, [:name] do |t, args|
    name   = ENV['name'] || fail('Please specify migration name by name=example_migration')
    path   = "#{Dir.pwd}/db/migrations/"
    number = Dir.entries('./db/migrations').sort.last.split('_').first.try(:to_i)
    prefix = number != 0 ? (number + 1).to_s.rjust(3, "0") : '001'
    file   = "#{prefix}_#{name.underscore}.rb"
    skeleton = <<-TEXT
Sequel.migration do

end
    TEXT
    File.open("#{path}#{file}", 'w') { |f| f.write(skeleton) }
  end
end
