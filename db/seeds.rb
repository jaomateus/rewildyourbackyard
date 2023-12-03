# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'httparty'

BARROS_PLANTS = [
  "Agastache rugosa",
  "Akebia quinata",
  "Allium ramosum",
  "Allium schoenoprasum",
  "Allium ursinum",
  "Alnus cordata",
  "Althea officinalis",
  "Amaranthus caudatus",
  "Amelanchier lamarckii",
  "Angelica keiskei",
  "Aralia cordata",
  "Arbutus unedo",
  "Armoracia rusticana",
  "Basella alba",
  "Buddleja davidii",
  "Caragana arborescens",
  "Casuarina equisetifolia",
  "Celtis australis",
  "Centella asiatica",
  "Ceratonia siliqua",
  "Chaenomeles speciosa",
  "Cichorium intybus",
  "Citrus aurantifolia",
  "Citrus limon",
  "Citrus sinensis",
  "Cornus mas",
  "Corylus avelana",
  "Crambe maritima",
  "Crataegus monogyna",
  "Crithmum maritimum",
  "Cydonia oblonga",
  "Diospyros kaki",
  "Elaeagnus angustifolia",
  "Elaeagnus multiflora",
  "Elaeagnus umbellata",
  "Elaeagnus ebbingei",
  "Eryobotrea japonica",
  "Feijoa sellowiana",
  "Ficus carica",
  "Ficus habrophyla",
  "Fragaria ananassa",
  "Fragaria moschata",
  "Fragaria vesca",
  "Fraxinus angustifolia",
  "Galium odoratum" ,
  "Gunnera manicata",
  "Halesia carolina",
  "Hippophae rhamnoides",
  "Jacaranda mimosifoila",
  "Juglans cinerea",
  "Laurus nobilis",
  "Ligustrum vulgare",
  "Lonicera caerulea",
  "Lycium ruthenicum",
  "Malus domestica",
  "Matteuccia struthiopteris",
  "Medicago sativa",
  "Mentha requienii",
  "Metrosideros excelsa",
  "Morus alba",
  "Olea europaea",
  "Passiflora manicata",
  "Passiflora morifolia",
  "Passiflotra edulis",
  "Paulownia elongata",
  "Paulownia tomentosa",
  "Perilla frutescens",
  "Persea americana",
  "Petasites japonicus",
  "Phillyrea angustifolia",
  "Pistacia lentiscus",
  "Plantago lanceolata",
  "Prunus armeniaca",
  "Prunus avium",
  "Prunus domestica",
  "Prunus dulcis",
  "Prunus persica",
  "Prunus pissardii",
  "Prunus salicina",
  "Prunus spinosa",
  "Psidium cattleyanum",
  "Psidium cattleyanum",
  "Psidium guajava",
  "Punica granatum",
  "Pyracantha coccinea",
  "Pyrus communis",
  "Pyrus pyrifolia",
  "Quercus robur",
  "Quercus suber",
  "Rheum rhaponticum",
  "Robinia pseudoacacia",
  "Rubus illecebrosus",
  "Sambucus nigra",
  "Saponaria officinalis",
  "Sinapis alba",
  "Solanum abutiloides",
  "Solanum betaceum",
  "Solanum muricatum",
  "Staphylea colchica",
  "Symphytum azureum",
  "Tagetes lucida",
  "Viburnum tinus",
  "Yuca filamentosa",
  "Zanthoxylum americanum",
  "Cercis siliquastrum",
  "Origanum vulgare",
  "Tetragonia tetragonioides",
  "Sorbus aucuparia",
  "Sorbus domestica",
  "Sorbus terminalis",
  "Sorbus aria",
  "Eugenia uniflora",
  "Syzygium cumini",
  "Phormium tenax",
  "Cytisus striatus",
  "Actinidia arguta",
  "Actinidia deliciosa",
  "Akebia trifoliata",
  "Hhmulus lupulus",
  "Amorpha fruticosa",
  "Aronia prunifolia",
  "Asimina triloba",
  "Decaisnea fargesii",
  "Elaeagnus umbellata",
  "Lonicera caerulea",
  "Rhus trilobata",
  "Debregeasia edullis",
  "Calycanthus floridus"
]

# def fetch_plant_data(plant_name)
#   response = HTTParty.get(
#     "https://trefle.io/api/v1/plants?token=#{ENV['TREFLE_TOKEN']}&filter[scientific_name]=#{plant_name}"
#   )

#   plant_data = response['data'][0] if response.code == 200
#   return nil unless plant_data

#   {
#     scientific_name: plant_data['scientific_name'],
#     common_name: plant_data['common_name'],
#     family: plant_data['family'],
#     genus: plant_data['genus'],
#     image_url: plant_data['image_url'],
#     id_trefle: plant_data['id']
#   }
# end

# ------------ Comment out when not necessary ----------
# puts 'First, let\'s delete all the plants'
# Plant.delete_all

# puts "Let's fill the database with some plants"
# puts 'Creating plants...'

# BARROS_PLANTS.each do |plant_name|
#   plant_data = fetch_plant_data(plant_name)
#   puts plant_data
#   if plant_data
#     Plant.create!(
#       id_trefle: plant_data[:id_trefle],
#       scientific_name: plant_data[:scientific_name],
#       common_name: plant_data[:common_name],
#       family: plant_data[:family],
#       genus: plant_data[:genus],
#       image_url: plant_data[:image_url],
#     )
#     puts "created #{plant_name}"
#   end
# end
puts "Destroying all sites..."
Site.destroy_all

puts "Destroying all users..."
User.destroy_all

puts "Creating users..."
user = User.create!(email: "jaomateus@gmail.com",
                    password: "123123",
                    first_name: "João",
                    last_name: "Mateus",
                    profession: "Landscape Architect / Web Developer")
file = File.open("app/assets/images/users/user1.jpeg")
user.user_photo.attach(io: file, filename: "user.jpeg", content_type: "image/png")
user.save


puts "Creating sites..."
PROJECT_TYPES = ["Food forest", "Forest garden", "Rewilding"]

sites = [
  { name: 'Horto dos Barros',
    description: 'Food forest to regenerate degraded piece of land',
    address: "Praia da Areia Branca"},
  { name: 'Bica',
    description: 'Rewilding project',
    address: "Lourinhã"},
  { name: 'Vale',
    description: 'Regenerative orchard',
    address: "Vale de adares"},
]

sites.each do |site|
  site = Site.create!(name: site[:name],
                      description: site[:description],
                      address: site[:address],
                      project_type: PROJECT_TYPES.sample,
                      starting_date: Time.now(),
                      user_id: user.id)

  guilds = [{name: 'Bananeira', photo: "bananeira.jpeg"},
            {name: 'Ervas aromáticas', photo: "aromatic_herbs.jpeg"},
            {name: 'Pêra abacate', photo: "abacateiro.jpeg"},
            {name: 'Limoeiro', photo: "limoeiro.jpeg"},
            {name: 'Laranjeira', photo: "laranjeira.webp"}]

  guilds.each do |guild|
    new_guild = Guild.create!(name: guild[:name], site_id: site.id)
    file = File.open("app/assets/images/guilds/#{guild[:photo]}")
    new_guild.cover_photo.attach(io: file, filename: guild[:photo], content_type: "image/png")
    new_guild.save
  end
end

puts 'Finished creating sites and guilds...'
