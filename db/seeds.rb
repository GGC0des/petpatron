# split local and production seed files in order to safely hide the seedfile from Github rather than .gitignore
if Rails.env.production?
  load(Rails.root.join('db', 'seeds.heroku.rb'))
else
  load(Rails.root.join('db', 'seeds.local.rb'))
end
