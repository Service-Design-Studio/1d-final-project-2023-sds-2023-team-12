<!-- Logo of website -->
<div align="center">

![Screenshot of a comment on a GitHub issue showing an image, added in the Markdown, of an Octocat smiling and raising a tentacle.](https://silvaco.com/wp-content/uploads/2020/02/stud_logo_large1-300x159.jpg)

</div>

<!-- Introduction of project -->

<div align="center">
  
# 60.004 - Service Design Studio 2023

</div>

<h3 align="center" style="text-decoration: none;">A joint collaboration between SUTD, Geberal and Google</h3>

<div align="center">

[Design Workbook](https://docs.google.com/document/d/16COJjqF0mA2ArpqxF8cm82YeVSxkOZuwUAbKLCD6a-8/edit#heading=h.30mvr6mmd9p3). [Google Site](https://sites.google.com/mymail.sutd.edu.sg/teamserverline/home). [Demo Video](https://pages.github.com/)

</div>

<!-- Our Mission -->


# Our Mission

Our innovative application, Missing Persons, serves as a comprehensive platform for users to report and seek their missing loved ones by providing detailed information, thereby facilitating the search for other missing individuals. This user-friendly app boasts an array of features, including advanced language detection that enables users to effortlessly fill up forms in their preferred language.

<!-- Acknewledgment -->
# Acknowledgments

1. Tran Cong Nam Anh Louis [@LouisAnhTran](https://github.com/LouisAnhTran?tab=repositories) (Project Manager + Technical Lead + Fullstack Developer + QA Engineer)
2. Nada Khan Suratee Binte Abdul Rahim Khan Suratee [@nadakhn](https://github.com/nadakhn)   (Deputy Project Manager + Product Designer + Frontend engineer)
3. Cephas Yeo Zhi Hao [@cephasyeo](https://github.com/cephasyeo) (ML/AI Engineer + QA Engineer) 
4. Saw Yi Xuan  [@yixuansaw](https://github.com/yixuansaw) (QA Engineer + Testing Engineer + Product Management)
5. Ayu Permata Halim Mendoza [@ayupermhm](https://github.com/ayupermhm) (Frontend Engineer + Product Management)
6. Senna Lin Tan [@sennshine](https://github.com/ayupermhm) (Graphic Design + Frontend Engineer) 

<!-- Getting started -->

# Getting Started

## Prerequisites 

### 1. Install Ruby

Open up a command line prompt. On macOS open Terminal.app; on Windows choose "Run" from your Start menu and type cmd.exe. Any commands prefaced with a dollar sign $ should be run in the command line. Verify that you have a current version of Ruby installed:

```ruby
$ ruby --version
```

Rails requires Ruby version 2.7.0 or later. It is preferred to use the latest Ruby version. If the version number returned is less than that number (such as 2.3.7, or 1.8.7), you'll need to install a fresh copy of Ruby.

To install Rails on Windows, you'll first need to install [Ruby Installer](https://rubyinstaller.org/). 

For more installation methods for most Operating Systems take a look at [ruby-lang.org.](https://www.ruby-lang.org/en/documentation/installation/)

### 2. Install SQLite 3

You will also need an installation of the SQLite3 database. Many popular UNIX-like OSes ship with an acceptable version of SQLite3. Others can find installation instructions at the  [SQLite3 website](https://www.sqlite.org/index.html)

Verify that it is correctly installed and in your load PATH:
```ruby
$ sqlite3 --version
```

### 3. Install Rails

To install Rails, use the gem install command provided by RubyGems:

```ruby
$ gem install rails
```

Rails will not run as expected if you are unable to install any of above required dependencies. Once you have finished installing all required above, to verify that you succesfully acquired tools and softwares without any error or system conflict, use the following command

```ruby
$ rails --version
```

If command line prompt returns result of "Rails 7.x.x" for the above command, congratulations, you have set up all required dependencies successfully and are ready to embark on Ruby on Rails journey. 

Otherwise, if command line promts fail to return output as expected, then the best workaround is properly starting from the first step again. And this time, make sure you follow every steps deligently. 

## Installation

### 1. Clone the remote repo

Clone the project remote repo to your local machine using the following command in your terminal or command line prompt.

```
git clone https://github.com/Service-Design-Studio/1d-final-project-2023-sds-2023-team-12.git
```

### 2. Ruby Gem libraries

After cloning the project to local machine, the following step is to ensure your local machine already acquire libraries and dependences required to run the application. Hence, to fulfill that requirement, use the following command.

> This command is used to install all the required gems specified in the application's Gemfile.


```
bundle install
```

If any modification is made to the Gemfile, whether it involves removing or adding a new gem, please use either the previous command or the following command accordingly.

```
bundle update
```

### 3. Setup Database

- Push migrations to database
```
rails db:migrate
```

* Seed data to development and testing environment database
```
rails db:seed
```
  
+ Create database

```
rails db:create
```

### 4. Set up Google ML/AI API keys

1. Create google cloud account and enable following API services, Cloud Translation API, Cloud Natuaral API

2. Create a new project and in your project console, navigate to "API & Services"  -> "Credentials" to create API key

Use the following command in your command line promptv (Unix-based)

``` ruby
export API_KEY=<your API key>
```

if you use Windows, please use the alternative command:

``` ruby
set API_KEY=<your API key>
```

## Run Development

> Note: All commands are executed under repository root path

### 1. Run Rails application

```
rails server
```

## Troubleshooting

### 1. Inspect development database

- Using Active Record

```
rails console
```

- Common ActiveRecord commands

```ruby
### BASIC OPERATIONS

# Create a new record in User model
user = User.create(name: "David", occupation: "Code Artist")

# return a collection with all users
users = User.all

# return the first user
user = User.first

# return the first user named David
david = User.find_by(name: 'David')

# update an entity in table
# approach 1:
user = User.find_by(name: 'David')
user.name = 'Dave'
user.save

# approach 2:
user = User.find_by(name: 'David')
user.update(name: 'Dave')

### ACITVE RECORD COMMON METHODS
# where method
users = User.where(name: 'John', age: 25)
users = User.where('age > ? AND name LIKE ?', 18, '%John%')

# Order method
Users=User.where(name: ‘DAVID’, occupation: ‘Code’).order(created_at: :desc)

# Find_by method
User=User.find_by(name: 'John', age: 25)

# Like method
Customer.where("email IS NOT NULL and email NOT LIKE '%@%’ ")

# Update all method
User. where(age: 25).update_all(name: 'John', gender: 'Male')

# Limit method
User.order(created_at: :desc).limit(20)

# Working Date and Time
User.where(“created_at > ?”,Date.new(2023,1,1))
User.where(“EXTRACT(MONTH FROM created_at)=?”,7)



```

### 2. Prepare Testing Database
> Note: Database schema for Rails application are synchronized for all three development, namely development, testing and production. However, data stored in database for each environment differ from one another. Any change in schema in development environment should be reflected to testing environment.

> Note: Seeding data using rails db:seed will add data to both testing and development environment, however data created in development environment will not be added to testing environment.

Run these commands

```
bundle exec rake db:migrate
bundle exec rake db:test:prepare
```

Optionally add some seed data in db/seeds.rb using the following command

```
rake db:seed
```

If any change made in schema in development, use this command to apply change to testing schema. 

```
bin/rails db:migrate RAILS_ENV=test
```

## Testing

### 1. Acceptance/System Testing Using Cucumber

+ All features/user stories along with happy and sad path scenarios are under [./features](https://github.com/Service-Design-Studio/1d-final-project-2023-sds-2023-team-12/tree/main/features)
+ All other steps definitions are under [./features/step_definitions](https://github.com/Service-Design-Studio/1d-final-project-2023-sds-2023-team-12/tree/main/features/step_definitions)
+ Capybara helper under [./features/support/universal_extensions.rb](https://github.com/Service-Design-Studio/1d-final-project-2023-sds-2023-team-12/blob/main/features/support/universal_extensions.rb)

Run acceptance test using the following command
```
bundle exec cucumber
```

### 2. Unit Testing 

+ 2.1 Using Minitest
Testing are defined under [./test](https://github.com/Service-Design-Studio/1d-final-project-2023-sds-2023-team-12/tree/main/test)

Run unit testing using Minitest
```
rails test
```

+ 2.2 Using Rspec
Testing are defined under [./spec](https://github.com/Service-Design-Studio/1d-final-project-2023-sds-2023-team-12/tree/main/spec)

Run unit testing using Rspec 
```
rspec
```






















