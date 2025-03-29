# README

This README documents whatever steps are necessary to get the
application up and running.

## Information for reviewers

### Contents of submission
  - I chose to build a thin rails application that provides the basic API for all the operations needed to support the MVP requirements for the Object Storage system.
  - There is a single controller (controllers/api/storage_controller.rb) that supports the ability to list files, download a single file, search for files, and delete a file.
  - There is a single service (app/services/storage_service.rb) that consists of stubbed out methods that are supposed to simulate actual calls to S3 to perform the intended operations. 
  - I am using the Pundit gem to authorize routes, however the actual methods for authorization (app/policies/storage_policy.rb) do not do much, so this is really just a stub implementation. This was done due to lack of time.
  - I am spoofing any decoding of a JWT token as a full implementation of handling login in this application or making a call to an authorization service and getting back a JWT token is too much scope for the amount of time I had for the entire assignment.

### Reason for choosing this implementation
  - The API is a crucial piece of implementation and an important place to begin development. It will be the hub of all the user operations that are needed in our system. It will be the integration point for our cloud storage access as well as authorization.
  - Given the time constraints of the exercise, spinning up a rails app is a fairly simple exercise that can be done quickly.

### Considerations, decisions, and assumptions
  - This implementation was chosen so that I could produce some amount of code for the purpose of the exercise. This does not imply that I would choose Rails as my backend for this application.
  - User authentication and permissions management is glossed over here for the sake of time. There is some rough stub code using Pundit, but its definitely not even a good start.

### Things I would add next
  - I would begin to create a unit test suite so that I have good test coverage. I would also consider creating integration tests from the beginning so that external systems could be tested and that my unit tests can be free from external system dependencies.
  - Error handling - none exists so far due to time constraints but this is a critical part of the application
  - Actual permissions management and checking
  - Actual integration with AWS S3
  - Front end application to integrate with the API
  - Integration with an authentication server or a login system that is local to the application so that proper authentication can be established. This is just a boilerplate app to get something running, but is remedial and unsecure.

## Setup Information

### Ruby version
  - 3.1.2

### System dependencies
  - run 'bundle install' to install dependencies

### Database creation
  - rake db:create

### To start Postgres, use the command:
  - brew services start postgresql

### Database initialization
  - rake db:migrate

### Running and testing the application
  - run 'bin/rails server' to start up
  - To test, open a REST client application (I chose Postman) and while the application is running, make a POST request to localhost:3000/api/storage with a payload like this:
  ```
  {
      "file": "abc",
      "filename": "test.doc"
  }
```
  - You should see a 200 response with a message and a filename in the payload.