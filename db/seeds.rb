# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
      { name: 'Action and Adventure'},
      { name: 'Classics'},
      { name: 'Detective and Mystery'},
      { name: 'Fantasy'},
      { name: 'Historical Fiction'},
      { name: 'Horror'},
      { name: 'Literary Fiction'},
      { name: 'Romance'},
      { name: 'Other'}
    ].each do |attribute|
      puts attribute
      if Category.find_by(name: attribute[:name]).nil?
        Category.create(name: attribute[:name])
      end
    end
