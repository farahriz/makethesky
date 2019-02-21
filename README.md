# Make the Sky

Make the Sky is a fun way to get inspiration from the weather. Just give the app a city, a day, and subset of weather information you'd like to examine and it will generate a pattern for a scarf based on the weather in the given location and time.

This project was inspired by various conceptual knitting patters such as ['Knit the Sky'](https://www.leafcutterdesigns.com/gifts/sky-scarf-yarn-kit/) by Lea Redmond and ['My Year in Temperatures - Scarf'](https://www.ravelry.com/patterns/library/my-year-in-temperatures--scarf-) by Kristen Cooper, and was originally created as the final assessment for NEXT Academy's Full-Stack Web Development Bootcamp. 


## Notes for Assessment
For ease of reference to the good folks at NEXT Academy, here's rundown of the required features and their functionality.

1. User authentication, without use of clearance/devise

   User authentication was created from scratch, using the bcrypt gem to hash passwords.

2. Concept of roles and proper authorisation

   * Users can only edit and delete their own scarves.
   * There are two kinds of users: superadmins and standard users. Superadmins have the power to edit and delete everyone's scarves. Normal users are limited to thier own scarves.*

3. Search functionality

   * Users can search through scarves. This is implemented through a custom scope.
   * *(Pending) Search functionality is implemented using the [pg_search](https://github.com/Casecommons/pg_search) gem.* 
   * *(Pending) There is an autocomplete on the 'City' input of creating a new scarf, that allows the user to type in a city and get suggestions based on cities already in the database.*

4. API integration

   The app queries the [Dark Sky Weather API](https://darksky.net/dev) in order to find the hourly weather of a given city for a given point in time.

5. AJAX implementation

   * Users can create a new scarf and have that scarf appear on the scarf index without the page refreshing.
   * *(Pending) A user can submit a form to generate a color scheme by querying [The Color API](http://www.thecolorapi.com/)*
   * *(Pending) A user can change the color palette of their scarf's stripes (without the page refreshing)*

6. RSpec tests for the application
   * Model validation and association test (for e.g. uniqueness, presence, numericality). 
   * At least 2 model specs, testing any custom model methods (test for happy and edgy paths) (not including the test made above). 
   * At least 1 integration spec using the Capybara library.
   
   * **All of the above can be found as spec files :,) **

7. Deployment to Heroku
   * Look up to find the link.
