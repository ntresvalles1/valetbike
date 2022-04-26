# ValetBike

Smith College CSC223: Software Engineering\
Starter App for ValetBike project

## Environment Configuration
Follow the general steps in the next section to set up your local development environment from scratch. It is essential that you **consult a more detailed guide** that corresponds to your specific type of development machine. Use one of the guides listed below to help you complete the steps for setting up ValetBike on your machine.

* [Install Ruby on Mac (Intel and M1)](https://mac.install.guide/ruby/index.html)
* [Install Ruby on Mac (M1 additional details)](https://github.com/deadroxy/valetbike/blob/master/notes/dev-enviro.md)
* [Install Ruby on Windows 10](https://gorails.com/setup/windows/10)

On Mac it is strongly recommended that you use asdf to install Ruby. On Windows you should set up your environment through the Windows Subsystem for Linux (WSL). The guides above explain how to do so in detail.

## General Configuration Steps

As you configure your environment you should **keep a log** where you **write down all the steps you take** and each command you type. You will inevitably run into errors setting up your development environment and maintaining a meticulous log will allow others to help you troubleshoot. 
 
**1. Fork & clone ValetBike repo**
* Click fork in the upper right hand corner of the ValetBike GitHub page
* Then create a local copy of your fork with:
* `git clone https://github.com/<username>/valetbike.git`

**2. Install MySQL 8**
* Download: https://dev.mysql.com/downloads/mysql
* Be sure to select the version that corresponds to your operating system (Intel Mac = x86, M1 Mac = ARM)
* Choose "Use Legacy Password Encryption" when installing
* Make note of the password you set for the root user
* After install make sure you add `/usr/local/mysql/bin` (or equivalent) to your path

**3. Install Ruby 3.0.2**
* Consult one of the guides linked in the previous section
* Use [asdf](https://asdf-vm.com/guide/getting-started.html) on Mac/Linux systems
* Use the [WSL](https://docs.microsoft.com/en-us/windows/wsl) on Windows systems
* Make sure you are using Ruby 3.02 before proceeding:
  * `cd valetbike` then `ruby -v` to check your version

**4. Install essential gems**
* Disable gem docs:
  * `echo "gem: --no-document" >> ~/.gemrc`
* Install Rails 6.1.4:
  * `gem install rails --version 6.1.4`
* Install MySQL gem:
  * `gem install mysql2`
  * Use the `-- --with-opt-dir="$(brew --prefix openssl@1.1)"` flag on M1 Macs
* Install required gems:
  * `bundle install`

**5. Configure database environment variables**
* Add a file called `.env` to your app's root directory
* Ensure that it includes the credentials you setup when installing MySQL:

```shell
MYSQL_USERNAME=root
MYSQL_PASSWORD=YOURPASSWORD
MYSQL_SOCKET=/tmp/mysql.sock              # For Mac
MYSQL_SOCKET=/var/run/mysqld/mysqld.sock  # For Windows
```

**6. Prepare database in MySQL**
* Run either `rake db:create`
* Or `mysql -u root -p` and `CREATE DATABASE valetbike_development;`

**7. Run database migrations**
* `rake db:migrate`

**8. Confirm app runs**
* Launch web server using `rackup` or `rails s`
* Make sure you are using `rails s` open http://localhost:3000 (or http://127.0.0.1:3000) in a browser
* You should see ValetBike welcome page
  
  
## Additional Configuration Steps

**1. Overview of dev environment setup (e.g. updates to .env or Gemfile)**
* Install leaflet-rails and geocoder gems
* Install bcrypt gem 
* Install rails-6.1.5
* `bundle install`

**2. Instructions for populating the database (e.g. a rake task or seed setup)**
* `rake import_csv:create_stationData`
* `rake import_csv:add_stationData`
* `rake import_csv:create_bikeData`
* `rake import_csv:add_bikeData`
* `rake import_csv:create_membershipData`
* `rake db:migrate`
* If needed, update database.yml page so that socket variables takes the correct socket path name. The socket path name can be found on the .env file, which includes the credential when you installed MySQL, or you could type “mysql -u root -p” on the terminal and then “SHOW VARIABLES LIKE ‘socket’;” when prompted with “MySQL[(none)]>”. The socket path should appear for you to copy into the database.yml file, next to the “socket” variable. You may also need to manually input your username and password for MySQL in line 12 and 13 if you encounter an “Access denied for user '...'@'localhost'” error. 
* When launching web server, use “rails s” (and not “rackup”) to avoid the error when creating an account that requires email authentication. Upon launching, you should be taken to the home page(http://127.0.0.1:3000 or http://[::1]:3000)  with the message “WELCOME TO BIKEA'S VALETBIKE”. 

## Changes made since prototype 
* Create Account:
    * Email authentication — users need to activate new accounts through email. Activating the account will automatically take one to the logged in homepage. (The activation link will stay active). 
    * “Sign-up now” requires the user to fill in Username, Email, First name, Last name, Password, Password confirmation, and Birth year. Not filling all of these fields will produce an error message with the list of fields left blank.
    * Forgot password— users can change their password through email (“reset password” link only works once, from second time on, it would take the user to the homepage in logged out state).
    * All emails from our website are sent from “bikeatest” (bikeatest@gmail.com).
* Profile Page
    * Not static, reflects personal information of the user who is currently signed in. 
    * Users can edit their personal information. 
    * Created more personal information fields, such as birthdate and name. 
    * List all the rides a user has taken. This includes: date, start station, end station, and duration. 
    * Display user's membership.
* Renting a Bike:
    * User fills in bike_id and selects station that they are renting a bike from.
        * If bike_id is not present at the station selected, the user will flash receive a warning, and user is not able to rent bike.
    * At end of ride, user selects station they are returning bike to.
* Map:
    * Shows current number of docked bikes at each station. 
    * Changed map marker.
* Membership:
    * Users can purchase a membership on the pricing page. 
    * Uses a "points" system in account on website to purchase membership. 
    * Points are displayed for each user.

## Description of the MVP's functionality
* The MVP allows users to sign up for an account. Once all the fields are completed, the user will receive an email authentication. 
* Users have a profile page that displays their personal information, past and current rides, and their current membership. 
* Users can rent and return a bike, with and without a membership.
* Through the map, users can see the number of docked bikes at each station.
* Users can purchase a membership through the pricing page.

## Recommended walkthrough steps to observe key features
* On the landing page, check the map and its features. Observe the different locations of the stations and the number of docked bikes at each station.
* Any users (logged in or not) should be able to see details of the app by clicking on “About Us” at the navigation bar. Click through all the pages on the navigation bar.
* Click on the profile page. If you do not have an account follow the instructions to sign-up. Otherwise, log-in.
    * After creating a new account, you must activate that account by clicking on the link sent to your email. 
* After logging in, view your profile page that reflects your personal information, membership, and past rides. 
* Click on Pricing Page to purchase a membership. Click on the membership you would like to purchase. 
    * Go to your profile page to make sure your purchased membership is reflected there. 
* Click on Activate a Bike to rent a bike. To test, refer to database to find the bike_ids at each current station. You must enter a valid bike_id at current station in order to rent a bike. If the bike_id is not at the station, you may not rent that bike.   
    * For an initial test you can try: bike_id: 6908 at Florence Bank Station.
* Return your bike by selecting the station you are returning to. 
* Click on Profile Page to see your ride reflected on your profile page. 
* Log out from profile page. 
