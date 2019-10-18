# Acebook by team Suckerberg

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

### Tech used

- Ruby on rails
- Devise
- Bootstrap
- PostgreSQL
- ActiveRecord

Testing

- Rubocop
- Travis
- Capybara
- FactoryBot
- Timecop
- Simplecov 

### Features

- team work approach
- learnings(major ones)
