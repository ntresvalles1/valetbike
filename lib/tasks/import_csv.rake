namespace :import_csv do
require 'csv'    

    desc "adding station data to the database"

    task create_stationData: :environment do
        csv_text = File.read(Rails.root.join('notes','station-data.csv'))
        csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
            s = Station.new;
            s.identifier = row['identifier']
            s.name = row['name']
            s.address = row['address']
            s.xcoord = row['xcoord']
            s.ycoord = row['ycoord']
            s.save
        end
    end

    desc "updating station data to the database"

    task add_stationData: :environment do
        csv_text = File.read(Rails.root.join('notes','station-data.csv'))
        csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
            s = Station.find_by(identifier: row['identifier'])
            s.docks = row['dock_count']
            s.save
        end
    end
    

    desc "adding bike data to the database"

    task create_bikeData: :environment do
        csv_text = File.read(Rails.root.join('notes', 'bike-data.csv'))
        csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
            b = Bike.new;
            b.identifier = row['identifier']
            b.save
        end
    end 
    
    
    task add_bikeData: :environment do
        csv_text = File.read(Rails.root.join('notes','bike-data.csv'))
        csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
            b = Bike.find_by(identifier: row['identifier'])
            b.current_station_id = row['current_station_identifier']     
            b.save
        end
    end


    task create_membershipData: :environment do
        csv_text = File.read(Rails.root.join('notes', 'membership-data.csv'))
        csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
            m = Membership.new;
            m.identifier = row['identifier']
            m.price = row['price']
            m.name = row['name']
            m.save
        end
    end 
    
end
