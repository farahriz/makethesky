# Make the Sky

Make the Sky is a fun way to get inspiration from the weather. Just give the app a city, a day, and subset of weather information you'd like to examine and it will generate a pattern for a scarf based on the weather in the given location and time.

This project was inspired by ['Knit the Sky'](https://www.leafcutterdesigns.com/gifts/sky-scarf-yarn-kit/) originally concieved by Lea Redmond, and was originally created as the final assessment for NEXT Academy's Full-Stack Web Development Bootcamp. 


## Notes for Assessment
For ease of reference to the good folks at NEXT Academy, here's rundown of the required features and their functionality.

1. User authentication, without use of clearance/devise

   User authentication was created from scratch, using the bcrypt gem to hash passwords.

2. Concept of roles and proper authorisation

   Users can only edit and delete their own scarves.

3. Search functionality
4. API integration

   The app queries the [Dark Sky Weather API](https://darksky.net/dev) in order to find the hourly weather of a given city for a given point in time.

5. AJAX implementation

   Users can create a new scarf and have that scarf appear on the scarf index without the page refreshing.

6. RSpec tests for the application
   * Model validation and association test (for e.g. uniqueness, presence, numericality). 
   * At least 2 model specs, testing any custom model methods (test for happy and edgy paths) (not including the test made above). 
   * At least 1 integration spec using the Capybara library.

7. Deployment to Heroku
   Please find it over at (placeholder text)


***


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
