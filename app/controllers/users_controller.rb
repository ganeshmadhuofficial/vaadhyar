class UsersController < ApplicationController

  resource_description do
    formats ['json']

    error code: 200, desc: 'OK'
    error code: 401, desc: 'Unauthorized'
    error code: 404, desc: 'Not Found'
    error code: 422, desc: 'Unprocessable entity'
    error code: 500, desc: 'Internal Server Error'
  end

  def_param_group :user do
    param :email, String, desc: 'Email of the user', required: true
    param :password, String, desc: 'Password of the user', required: true
    param :password_confirmation, String, desc: 'Confirm Password', required: true
    param :first_name, String, desc: 'First name of the user', required: true
    param :last_name, String, desc: 'Last name of the user'
    param :phone_number, String, desc: 'Phone Number of the user', required: true
    param :age, Fixnum, desc: 'Age of the user', required: true
    param :experience, Fixnum, desc: 'Experience of the user (Vaadhyar)', required: true
    param :is_admin, [true,false], 'Is user an admin? defaults to false'
    param :is_vaadhyar, [true,false], 'Is user a vaadhyar? defaults to false'
    param :city, String, desc: 'City of the user'
    param :state, String, desc: 'State of the user'
    param :region, String, desc: 'Region of the user'
    param :latitude, Fixnum, desc: 'Latitue of the user'
    param :longitude, Fixnum, desc: 'Longitude of the user'
    param :vedam, [], desc: 'Vedam of the user, Eg: ["Rig","Yajur","Samam","Atharvanam"]'
    param :classification, [], desc: 'Classification of the user, Eg: ["Vadakalai","Thenkalai"]'
  end

  api :GET, "/users", "Get all Users"
  description <<-EOS
    == Listing all users
     This API is used for listing all users (admin/vaadhyar/client).
  EOS
  example '
  Response:
      [
        {
          "id": 3,
          "provider": "email",
          "uid": "testuser@gmail.com",
          "email": "testuser@gmail.com",
          "first_name": "Test",
          "last_name": "User",
          "phone_number": 1231231230,
          "age": 25,
          "experience": 5,
          "is_admin": false,
          "is_vaadhyar": false,
          "state": null,
          "city": null,
          "region": null,
          "latitude": null,
          "longitude": null,
          "vedam": [
            "yajur"
          ],
          "classification": [
            "a",
            "b"
          ],
          "created_at": "2016-07-19T15:26:44.965Z",
          "updated_at": "2016-07-19T15:27:28.939Z"
        },
        {
          "id": 1,
          "provider": "email",
          "uid": "realuser@gmail.com",
          "email": "realuser@gmail.com",
          "first_name": "Real",
          "last_name": "User",
          "phone_number": 1231231234,
          "age": 25,
          "experience": 5,
          "is_admin": false,
          "is_vaadhyar": false,
          "state": null,
          "city": null,
          "region": null,
          "latitude": null,
          "longitude": null,
          "vedam": null,
          "classification": null,
          "created_at": "2016-07-19T13:43:38.826Z",
          "updated_at": "2016-07-19T13:56:30.922Z"
        }
      ]
  '
  def index
    render json: User.all
  end

  api :POST, "/api/v1/auth", 'Create User'
  param_group :user
  description <<-EOS
    == Creates a user
     This API is used to create a user (admin/vaadhyar/client).
  EOS
  example '
    Request:
       {
          "email":"testuser@gmail.com",
          "password":"test@123",
          "password_confirmation":"test@123",
          "first_name":"Test",
          "last_name":"User",
          "phone_number":1231231230,
          "age":25,
          "experience":5
        }

    Response:
      Sucesss:
        {
          "status": "success",
          "data": {
            "id": 4,
            "provider": "email",
            "uid": "testuser1@gmail.com",
            "email": "testuser1@gmail.com",
            "first_name": "Test",
            "last_name": "User",
            "phone_number": 1231231230,
            "age": 25,
            "experience": 5,
            "is_admin": false,
            "is_vaadhyar": false,
            "state": null,
            "city": null,
            "region": null,
            "latitude": null,
            "longitude": null,
            "vedam": null,
            "classification": null,
            "created_at": "2016-07-20T14:01:29.737Z",
            "updated_at": "2016-07-20T14:01:29.833Z"
          }
        }

        Sucess Response will contain auth_token, client, expiry, token_type and uid in HEADERS section for authenticating other requests.

      Error:
        {
          "status": "error",
          "data": {
            "id": null,
            "provider": "email",
            "uid": "",
            "email": "testuser@gmail.com",
            "first_name": "Test",
            "last_name": "User",
            "phone_number": 1231231230,
            "age": 25,
            "experience": 5,
            "is_admin": false,
            "is_vaadhyar": false,
            "state": null,
            "city": null,
            "region": null,
            "latitude": null,
            "longitude": null,
            "vedam": null,
            "classification": null,
            "created_at": null,
            "updated_at": null
          },
          "errors": {
            "email": [
              "already in use",
              "has already been taken"
            ],
            "phone_number": [
              "has already been taken"
            ],
            "full_messages": [
              "Email already in use",
              "Email has already been taken",
              "Phone number has already been taken"
            ]
          }
        }
  '
  def create
  end

  api :POST, "/api/v1/auth/sign_in", 'Login User'
  description <<-EOS
    == Logs in a user
     This API is used for login (admin/vaadhyar/client).
  EOS
  param :email, String, desc: 'Email of the user', required: true
  param :password, String, desc: 'Password of the user', required: true
  example '
    Request:
       {
          "email":"testuser@gmail.com",
          "password":"test@123"
       }

    Response:
      Sucesss:
        {
          "data": {
            "id": 1,
            "provider": "email",
            "uid": "testuser@gmail.com",
            "email": "testuser@gmail.com",
            "first_name": "Test",
            "last_name": "User",
            "phone_number": 1231231230,
            "age": 25,
            "experience": 5,
            "is_admin": false,
            "is_vaadhyar": false,
            "state": null,
            "city": null,
            "region": null,
            "latitude": null,
            "longitude": null,
            "vedam": null,
            "classification": null
          }
        }

        Sucess Response will contain auth_token, client, expiry, token_type and uid in HEADERS section for authenticating other requests.

      Error:
        {
           "errors": [
             "Invalid login credentials. Please try again."
           ]
        }
  '
  def new
  end

  api :PUT, "/api/v1/auth", 'Update User'
  description <<-EOS
    == Update a user
     This API is used for updating the user's details.
  EOS
  param_group :user
  error code: 200, desc: 'OK'
  error code: 404, desc: 'Not Found'
  example '
    Request:
       HEADERS:
         uid:  <<UID>>
         access-token: <<ACCESSTOKEN>>
         client: <<CLIENT>>

       BODY:
         {
           "email":"testuser@gmail.com",
           "password":"test@123",
           "password_confirmation":"test@123",
           "first_name":"Test",
           "last_name":"User",
           "phone_number":1231231230,
           "age":25,
           "experience":5
         }

    Response:
      Sucesss:
        {
          "status": "success",
          "data": {
            "id": 2,
            "provider": "email",
            "uid": "testuser@gmail.com",
            "email": "testuser@gmail.com",
            "first_name": "Test",
            "last_name": "User",
            "phone_number": 1231231230,
            "age": 25,
            "experience": 5,
            "is_admin": false,
            "is_vaadhyar": false,
            "state": null,
            "city": null,
            "region": null,
            "latitude": null,
            "longitude": null,
            "vedam": [
              "yajur"
            ],
            "classification": [
              "a",
              "b"
            ],
            "created_at": "2016-07-19T12:36:51.340Z",
            "updated_at": "2016-07-20T15:22:03.690Z"
          }
        }

      Error:
        {
          "status": "error",
          "errors": [
            "User not found."
          ]
        }
  '
  def update
  end

  api :DELETE, "/api/v1/auth/sign_out", 'Logout User'
  description <<-EOS
    == Logs out a user
     This API is used for logout (admin/vaadhyar/client).
  EOS
  error code: 200, desc: 'OK'
  error code: 404, desc: 'Not Found'
  example '
    Request:
       HEADERS:
         uid:  <<UID>>
         access-token: <<ACCESSTOKEN>>
         client: <<CLIENT>>

    Response:
      Sucesss:
        {
          "success": true
        }

      Error:
        {
          "errors": [
            "User was not found or was not logged in."
          ]
        }
  '
  def edit
  end

  api :DELETE, "/api/v1/auth", 'Delete User'
  description <<-EOS
    == Deletes a user
     This API is used for deleting a user.
  EOS
  error code: 200, desc: 'OK'
  error code: 404, desc: 'Not Found'
  example '
    Request:
       HEADERS:
         uid:  <<UID>>
         access-token: <<ACCESSTOKEN>>
         client: <<CLIENT>>

    Response:
      Sucesss:
        {
          "status": "success",
          "message": "Account with UID testuser@gmail.com has been destroyed."
        }

      Error:
        {
          "status": "error",
          "errors": [
            "Unable to locate account for destruction."
          ]
        }
  '
  def destroy
  end

end
