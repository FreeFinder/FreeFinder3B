# FreeFinder Milestone 3B

### (1) How to compile
You will need XCode in order to compile our code. Once you've cloned the repo, open it up in XCode. 
If you experience troubles/errors with the packages, try quitting XCode and reopening it. 
### (2) How to run the code
Press run in XCode (the play button on the top left). Alternatively, do command R or go to product then run in the menu bar. Make sure the scheme is set to FreeFinders3B.
### (3) How to run the unit test cases
Run command U (alternatively go to Product in the menu bar and then press test).
### (4) Some acceptance tests to try (i.e., what inputs to use, and what outputs are expected)
### (5) Text description of what is implemented. You can refer to the use cases and user stories in your design document.
We've implemented the following use cases:
* Create item
* Delete item
* Comment on post
* Refresh map
* Sign in
* View map/list
* View posting

Along with this we've implemented our database using MongoDB. Many of these use cases interact with the database. 
### (6) Who did what: who paired with who, which part is implemented by which pair
Main pairs:
* Charlie and William - Sign In and MapKit
* Jordan and Sydney - add comment, create item and delete item and testing update
* Ellen and Ruxi - UI/UX (with help from Jordan) 
* Steven and Madhav - Backend/Database
However,towards the end it became more of a group effort in finishing up the app. 
### (7) Changes: design changes or unit test changes from earlier milestones
We are not implementing the ability to upload a photo in this iteration. For this iteration, we've made the counter fixed at one. Incrementing this and chainging it will come in the later iteration. For the classes, in general, for every function that requires database access we have a new function that is db_function that just handles the database side. In addition, we added comment and create_item to the user class. Comment and sign_out now return boolean and create_item (under user) returns the Item if it is successfully added. 

Iteration 2 will (hopefully) include the following features:
* Notifications (and preferences)
* Filtering
* UI/UX Improvements
* Sign out
* Counter/quantity functionality
* Adding photos (?) -- we are unsure if we can get the capability to store images somewhere, so this feature might be dropped
### (8) Other information 
