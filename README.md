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
* If using `rackup` open http://localhost:9292 (or http://127.0.0.1:9292) in a browser
* If using `rails s` open http://localhost:3000 (or http://127.0.0.1:3000) in a browser
* You should see ValetBike welcome page
  
  
## Additional Configuration Steps

**1. Overview of dev environment setup (e.g. updates to .env or Gemfile)**
* added Leaflet gems
* Installed bcrypt gemfile to hash and secure passwords. 
gem 'bcrypt', '~> 3.1.11' 

**2. Instructions for populating the database (e.g. a rake task or seed setup)**
* Rake file for importing csv file 
```Import_csv.rake```

## Description of the Prototype's Functionality
**
* Current prototype allows users to signup and login via the Profile page
* For now, the homepage displays a map with 1 station 
* Allows users to access the profile page, which shows static personal information of “Anthony” that is visible when logged in, About us pageant where any users can see and learn about Bikea, Pricing page, and Unlock a bike through navigation bar at the top. 
* It also allows developers to populate users, rides, memberships, stations, and bike database through rake commands. 

## Recommended walkthrough steps to observe key features
**
* On the landing page, check the map and its features. We should observe a station with the number of docked bikes in the Northampton area 
* Any users (logged in or not) should be able to see details of the app by clicking on “About Us” at the navigation bar 
* Clicking on Profile, when one is not logged in, will take you to a login page. If you don’t have an account yet, you can select the link to “Sign Up!” and create a new account. Sign-up page will ask the user to input their username, email, password, and confirmation password. You could also test the login by using already registered account, which is “Bikea” for username and “Bikea” for password. Wrong match between the username and password will produce a warning message in black “Incorrect username and/or password”. Once you have successfully logged in, it should take you to the static profile page. Note that for this prototype, confirmation email is not sent and the user can create an account with fake email address. 
* Our current static profile page is just a simple html that does not reflect the logged-in users information. For this prototype, the successful login will take you to a page with the persona of Ariel Thirster.
* “Pricing and Plans” will take you to a static page with a table of 2 pricing options. For the purpose of this submission, we have not included a payment process.
* “Activate a Bike” is currently a static page with an activation code that the user can enter on a bike to activate it.
* Log out option is also available at the top of the “personal” profile page. When selected, the user can logout.
Note that logged in status is maintained even when the user goes through other pages unless the user selects logout or  quits the page. 



