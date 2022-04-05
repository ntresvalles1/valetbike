<<<<<<< HEAD
require 'csv' 

desc 'import csv data'
namespace :import_csv do
=======
namespace :import_csv do
require 'csv'    
>>>>>>> prototype-test

    task create_stationData: :environment do
        csv_text = File.read(Rails.root.join('notes','station-data.csv'))
        csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
            s = Station.new;
            s.identifier = row['identifier']
            s.name = row['name']
            s.address = row['address']
<<<<<<< HEAD
            s.xcoord = row['xcoord']
            s.ycoord = row['ycoord']
            s.save
        end
    end
    
    task create_bikeData: :environment do
        csv_text = File.read(Rails.root.join('notes', 'bike-data.csv'))
        csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
            b = Bike.new;
            b.identifier = row['identifier']
            b.save
        end
    end 
    
end
=======
            s.save
        end
    end

    task create_bikeData: :environment do
    	csv_text = File.read(Rails.root.join('notes', 'bike-data.csv'))
    	csv = CSV.parse(csv_text, :headers => true)
    	csv.each do |row|
            b = Bike.new;
            b.identifier = row['identifier']
            b.save
	end
    end 

end
>>>>>>> prototype-test
