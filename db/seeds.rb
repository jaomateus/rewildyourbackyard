# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleting sites..."
Site.destroy_all

puts "Creating sites..."
sites = [
  { name: 'Horto dos Barros',
    description: 'Food forest to regenerate degraded piece of land'},
  { name: 'Bica',
    description: 'Rewilding project'},
  { name: 'Vale',
    description: 'Regenerative orchard'},
]

sites.each do |site|
  Site.create!(name: site[:name], description: site[:description])
end

puts 'Finished...'
