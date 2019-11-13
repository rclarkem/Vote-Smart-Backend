# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
url = 'https://api.propublica.org/congress/v1/116/senate/members.json'

def rep_params(rep)
  {
    proPublica_id: rep['id'],
    short_title: rep['short_title'],
    first_name: rep['first_name'],
    last_name: rep['last_name'],
    middle_name: rep['middle_name'],
    ocd_id: rep['ocd_id'],
    twitter_account: rep['twitter_account']
  }
end

def save_representative(rep)
  saved_rep = Representative.create(rep)
  p "#{saved_rep.first_name}, saved = #{saved_rep.valid?}"
end

response = RestClient::Request.execute( method: :get, url: url, headers: {'X-API-Key': ENV['PRO_PUBLICA_API']})
results = JSON.parse(response.body)['results']
sentors = results[0]['members']

sentors.each do |sentor|
  rep = rep_params(sentor)
  save_representative(rep)
end

url = 'https://api.propublica.org/congress/v1/116/house/members.json'
response = RestClient::Request.execute( method: :get, url: url, headers: {'X-API-Key': ENV['PRO_PUBLICA_API']})
results = JSON.parse(response.body)['results']
members = results[0]['members']

members.each do |member|
  rep = rep_params(member)
  save_representative(rep)
end
