desc "This task is called by the Heroku scheduler add-on"
task parse: :environment do
  puts "Updating feed..."
  Link.create title: DateTime.now.to_s, provider: Provider.first
  puts "done."
end

task :send_reminders => :environment do
  User.send_reminders
end
