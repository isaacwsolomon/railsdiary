# Rails Diary

A simple diary application to test out making and deploying a web app using Ruby on Rails.

This follows the basics of the tutorial on the home page of https://rubyonrails.org/

I've added some basic authentication so you can sign up and log in to view your private diary. This isn't fully secured so I don't recommend using this for anything sensitive. In the future I could add a better authentication system but I wanted to keep it as simple as possible to get up and running.

## Preparing your computer for a new Rails project

You'll need Ruby installed. This project is currently using Ruby 3.1.2. I'm using asdf and direnv to manage language versions and to create isolated development environment based on directories. On macOS you can get this all set up with the following commands:

```
brew install curl git asdf
asdf plugin-add direnv
asdf direnv setup --shell zsh --version latest
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 3.1.2
```

Then set up the project directory:

```
mkdir railsdiary
cd railsdiay
asdf direnv local ruby 3.1.2
```

The last command will create two files: `.tool-versions` and `.envrc`

Open the `.envrc` file and make sure it has the following content:

```
use asdf
layout ruby
bundle check
```

To make sure these settings are picked up you might need to `cd` out and back into the directory.

Now we can install Rails and create our project:

```
gem install rails
rails new .
bundle install
```

Now you can run rails locally with `rails server`.

To make this project I then followed some of the steps from the tutorial on the Rails homepage: https://rubyonrails.org/

You can see the changes I made in the commit history. To keep things simple I missed out some steps from the tutorial and found some blog posts to help with code snippets - they're referenced in the git commits.

## Deploy to fly.io

Fly make it easy to get a Rails app up and running in production. You can see this app at https://isaacdiary.fly.dev

If you want to deploy your own version, fork this repo and follow the [fly docs to get flyctl installed](https://fly.io/docs/getting-started/installing-flyctl/) on your computer.

Once you're logged into fly you can simple run `flyctl launch` and follow the instructions.

To keep things simple this app is using SQLite for the database. After deploying to fly you'll need to round the migrations there. You can do this with the following commands:

```
flyctl ssh console
cd app
bin/rails db:migrate
```