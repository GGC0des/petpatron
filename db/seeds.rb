# split local and production seed files in order to safely hide the seedfile from Github rather than .gitignore
if Rails.env.production?
  path = Rails.root.join('db', 'seeds.heroku.rb')
  load(path) if File.exist?(path)
else
  load(Rails.root.join('db', 'seeds.local.rb'))
end
