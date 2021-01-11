# README

# Tech Stack
  - Ruby 2.7.0
  - Rails 6.0.3.4
  - Database Postresql

# Database Tables
  - users
    Holding information for user with valid email address

# Services
  - EmailCombinationGenerator
    This service creates the combination of email address using first_name, last_name and url of user. It'll also discard the emails which already exist in database in one query. So it'll help us to hit the api as low as needed.
  
  - EmailCombinationValidator
    This service hit the 3rd party api to check if email is valid or not. If email is valid then it will return that valid email, and will not check remaining emails.

# Controllers
  - users_controller
    It will hit the above two services to generate and validate the emails. After that, First valid email will be saved in database with the given user. 
    
# Setup Instructions
  1- Clone the repo
  2- bundle install
  3- yarn install
  4- bundle exec rake db:create db:migrate
  5- create config/master.key and replace the extration key in it. (I'll send it in email)
  5- rails s
  6- Browse http://localhost:3000
