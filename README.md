<!-- Logo of website -->
<div align="center">

![Screenshot of a comment on a GitHub issue showing an image, added in the Markdown, of an Octocat smiling and raising a tentacle.](https://silvaco.com/wp-content/uploads/2020/02/stud_logo_large1-300x159.jpg)

</div>

<!-- Introduction of project -->

<div align="center">
  
# Service Design Studio 2023

</div>

<h3 align="center" style="text-decoration: none;">A joint collaboration between SUTD, Geberal and Google</h3>

<div align="center">

[Design Workbook](https://pages.github.com/). [Google Site](https://pages.github.com/). [Demo Video](https://pages.github.com/)

</div>

<!-- Our Mission -->


# Our Mission

As an information portal, AMADEUS allows admin users to upload important articles, which are tagged, categorised and summarised by varying forms of artificial intelligence. Making use of Google's Cloud APIs, AMADEUS is able to effectively tackle the large diversity and high volumes of relevant information for its users.

<!-- Acknewledgment -->
# Acknowledgments
1. Tran Cong Nam Anh (Louis) [@LouisAnhTran](https://github.com/LouisAnhTran?tab=repositories) (Technical Lead + Fullstack Developer + QA Engineer)
2. Nada - (Project Manager)
3. Cephas
4. Yi Xuan
5. Ayu
6. Senna

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

```
bundle install
```

This command is used to install all the required gems specified in the application's Gemfile.

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































