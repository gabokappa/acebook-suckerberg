# Acebook by team Suckerberg

[![Build Status](https://travis-ci.com/gabokappa/acebook-suckerberg.svg?branch=master)](https://travis-ci.com/gabokappa/acebook-suckerberg)

Contributors:
- [Eduard Kulcsickij-Gut](https://github.com/EdZeno)
- [Gabriel Gonzalez](https://github.com/gabokappa)
- [Iliana Meza](https://github.com/ilimeza)
- [Valeria Serci](https://github.com/ValeSer)
- [Volker Bergner](https://github.com/v-c-b)

Acebook is a group project where we mimicked some of the functionality present on social media  networks. The backend is built using Ruby on Rails with a PostgreSQL database. You can find a hosted version here: http://ec2-52-57-26-149.eu-central-1.compute.amazonaws.com:3000/

### Local installation

* Clone this repository
* Run the following commands
```
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:migrate RAILS_ENV=test
```
* Check all the tests are running using ```rspec``` commmand.
* Run the server using ``` rails server ``` and open your browser to navigate to localhost:3000

## Technologies Used
| Technology | Description | Use |
| :--------------------------------: | :--------------------------------: | :--------------------------------: |
| ActiveRecord | Library for relational SQL databases | Object Relational Mapping|
| Bootstrap | CSS framework | CSS template and responsive design|
| Capybara | Testting framework | Feature tests|
| Devise | Authentication solution | User authentication|
| Factorybot | Factory library | Test fixtures|
| PostgreSQL | Object-relational database system | Store app data|
| Rails | Web app framework | MVC framework|
| RSpec | Ruby test framework  | Test Rails models and controllers|
| RuboCop | Ruby linter | Maintain Ruby code quality|
| Simplecov | code coverage library | Gathers code coverage|
| Timecop | Ruby gem | Test time-dependent code|
| Travis | Continuous integration service |Ensure pull requests don't break deployed code|


### Learnings

Please see the various pages in the [wiki](https://github.com/gabokappa/acebook-suckerberg/wiki)

### Features

- Users can sign-up /login
- Users can post, edit that post, delete a post and like the post.
- Users can comment on a post, edit, delete and like that comment.
- Users have seperate 'walls' other users can post on those walls.
- Users have a profile picture and can add albums.
