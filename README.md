[![Build Status](https://travis-ci.com/kerrimcm/pace.svg?branch=master)](https://travis-ci.com/kerrimcm/pace)
# Pace

A running app built in Rails, designed to help runners feel safer and train harder.

Originally inspired by the idea of bringing people together via their common interests, namely exercise, we stretched the idea further to address the social issue of women's safety when running. The app is inclusive of all people, but offers a medium through which people can meet up safely and securely. Where they can find a partner to hold them accountable to their fitness goals and provide them with safety along the way. 

<img src="app/assets/images/pace-logo.png" width="150" height="150">

![login demo](app/assets/images/Login.gif)

## Getting started

* After cloning into this repository run `bundle install` to install required gems
* Then run these commands to set up the databases:
`rails db:create`
`rails db:migrate`
* To check tests passing run `rspec`
* Finally, to view the site, run `rails server`

## Screenshots

<details>
  <summary>Landing</summary>
<img src="app/assets/images/landing.png">
</details>

<details>
  <summary>Home page</summary>
<img src="app/assets/images/home-page.png">
</details>

<details>
  <summary>User profile</summary>
<img src="app/assets/images/user-profile.png">
</details>

<details>
  <summary>Navbar</summary>
<img src="app/assets/images/navbar.png">
</details>

<details>
  <summary>Messaging</summary>
<img src="app/assets/images/messaging.png">
</details>

<details>
  <summary>Maps</summary>
<img src="app/assets/images/maps.gif">
</details>

## Features

* User sign up/log in/log out
* User can input key pieces of fitness information about themselves into their profile
* Users can search for other users based on these criteria
* Users can visit the profiles of other users
* Users can message other users on their profiles
* Users can see messages delivered to them in their inbox
* All conversations are stored in their inbox
* Users can set a meetup point on a map where they can meet up with their partner
* They can share the location in the chat
* They can view the meetup spot marked on a map
* Users can endorse other users 
* Users can report other users

## Built using
* Ruby on Rails
* Ruby
* HTML
* CSS
* JavaScript
* PostgreSQL
* Google Maps API
